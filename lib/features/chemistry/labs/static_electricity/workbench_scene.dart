








import 'package:flutter/material.dart';

class WorkbenchScene extends StatefulWidget {
  final bool isRubbed;
  final ValueChanged<String> onRub;
  final ValueChanged<bool> onProximityChanged;
  final VoidCallback onReset;

  const WorkbenchScene({
    super.key,
    required this.isRubbed,
    required this.onRub,
    required this.onProximityChanged,
    required this.onReset,
  });

  @override
  State<WorkbenchScene> createState() => _WorkbenchSceneState();
}

class _WorkbenchSceneState extends State<WorkbenchScene> {
  Offset _rodPosition = const Offset(0.5, 0.68);
  Offset _lastDragPosition = Offset.zero;

  bool _isDraggingRod = false;

  static const double _proximityDistance = 0.24;

  final Offset _leftBalloon = const Offset(0.30, 0.38);
  final Offset _rightBalloon = const Offset(0.70, 0.38);

  bool _isNearBalloon(Offset balloon) {
    return (_rodPosition - balloon).distance < _proximityDistance;
  }

  void _checkProximity() {
    final near = widget.isRubbed &&
        (_isNearBalloon(_leftBalloon) ||
            _isNearBalloon(_rightBalloon));

    widget.onProximityChanged(near);
  }

  void _updateRodPosition(Offset delta, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    setState(() {
      final next = _rodPosition +
          Offset(
            delta.dx / size.width,
            delta.dy / size.height,
          );

      _rodPosition = Offset(
        next.dx.clamp(0.08, 0.92).toDouble(),
        next.dy.clamp(0.15, 0.88).toDouble(),
      );
    });

    _checkProximity();
  }

  Offset _balloonMovement(Offset balloon) {
    if (!widget.isRubbed || !_isNearBalloon(balloon)) {
      return Offset.zero;
    }

    final difference = _rodPosition - balloon;
    final distance = difference.distance;

    if (distance == 0) return Offset.zero;

    return Offset(
      difference.dx / distance * 20,
      difference.dy / distance * 20,
    );
  }

  void _resetScene() {
    setState(() {
      _rodPosition = const Offset(0.5, 0.68);
      _isDraggingRod = false;
    });

    widget.onReset();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(
          constraints.maxWidth,
          constraints.maxHeight,
        );

        if (size.width <= 0 || size.height <= 0) {
          return const SizedBox.shrink();
        }

        return Container(
          color: const Color(0xFFEAF2F8),
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: size.height * 0.12,
                child: Container(
                  color: const Color(0xFFDCE8F1),
                  alignment: Alignment.center,
                  child: const Text(
                    'مختبر الكهرباء الساكنة',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF263B50),
                    ),
                  ),
                ),
              ),

              _buildBalloon(
                size: size,
                center: _leftBalloon,
                movement: _balloonMovement(_leftBalloon),
                color: const Color(0xFFE85D75),
                label: 'البالون الأول',
              ),

              _buildBalloon(
                size: size,
                center: _rightBalloon,
                movement: _balloonMovement(_rightBalloon),
                color: const Color(0xFF5799E8),
                label: 'البالون الثاني',
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: size.height * 0.12,
                height: size.height * 0.20,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFB98255),
                    border: Border(
                      top: BorderSide(
                        color: Color(0xFF8D5B38),
                        width: 7,
                      ),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'طاولة التجربة',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              if (!widget.isRubbed) ...[
                Positioned(
                  left: size.width * 0.10,
                  bottom: size.height * 0.36,
                  child: Draggable<String>(
                    data: 'wool',
                    feedback: Material(
                      color: Colors.transparent,
                      child: _buildMaterial(
                        label: 'قطعة الصوف',
                        icon: Icons.cloud,
                        color: Colors.brown,
                      ),
                    ),
                    childWhenDragging: Opacity(
                      opacity: 0.3,
                      child: _buildMaterial(
                        label: 'قطعة الصوف',
                        icon: Icons.cloud,
                        color: Colors.brown,
                      ),
                    ),
                    child: _buildMaterial(
                      label: 'قطعة الصوف',
                      icon: Icons.cloud,
                      color: Colors.brown,
                    ),
                  ),
                ),

                Positioned( right: size.width * 0.10, bottom: size.height * 0.36, child: Draggable<String>( data: "silk", feedback: Material(color: Colors.transparent, child: _buildMaterial(label: "قطعة الحرير", icon: Icons.texture, color: Colors.purple)), childWhenDragging: Opacity(opacity: 0.3, child: _buildMaterial(label: "قطعة الحرير", icon: Icons.texture, color: Colors.purple)), child: _buildMaterial(label: "قطعة الحرير", icon: Icons.texture, color: Colors.purple), ), ),

                Positioned(
                  left: size.width * 0.36,
                  bottom: size.height * 0.37,
                  child: DragTarget<String>(
                    onWillAcceptWithDetails: (details) =>
                        details.data == "wool" || details.data == "silk",
                    onAcceptWithDetails: (details) {
                      widget.onRub(details.data);
                    },
                    builder: (context, candidates, rejected) {
                      return _buildRod(
                        highlighted: candidates.isNotEmpty,
                      );
                    },
                  ),
                ),
              ],

              if (widget.isRubbed) ...[
                Positioned(
                  top: size.height * 0.13,
                  left: 12,
                  right: 12,
                  child: const Text(
                    'اسحب ساق المطاط نحو البالونين ولاحظ التأثير.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF263B50),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Positioned(
                  left: size.width * _rodPosition.dx - 45,
                  top: size.height * _rodPosition.dy - 15,
                  child: GestureDetector(
                    onPanStart: (details) {
                      _lastDragPosition = details.globalPosition;
                      setState(() {
                        _isDraggingRod = true;
                      });
                    },
                    onPanUpdate: (details) {
                      final delta =
                          details.globalPosition - _lastDragPosition;

                      _lastDragPosition = details.globalPosition;

                      _updateRodPosition(delta, size);
                    },
                    onPanEnd: (_) {
                      setState(() {
                        _isDraggingRod = false;
                      });
                    },
                    child: _buildRod(
                      highlighted: _isDraggingRod,
                    ),
                  ),
                ),
              ],

              Positioned(
                bottom: 8,
                left: 12,
                child: IconButton.filled(
                  onPressed: _resetScene,
                  icon: const Icon(Icons.refresh),
                  tooltip: 'إعادة التجربة',
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBalloon({
    required Size size,
    required Offset center,
    required Offset movement,
    required Color color,
    required String label,
  }) {
    final left = size.width * center.dx - 32 + movement.dx;
    final top = size.height * center.dy - 41 + movement.dy;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOut,
      left: left,
      top: top,
      child: Column(
        children: [
          Semantics(
            label: label,
            child: Container(
              width: 65,
              height: 82,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
              BoxShadow(
                color: movement == Offset.zero ? Colors.black26 : color.withOpacity(0.55),
                blurRadius: movement == Offset.zero ? 7 : 18,
                spreadRadius: movement == Offset.zero ? 0 : 3,
                offset: const Offset(2, 4),
              ),
            ],
              ),
            ),
          ),
          Container(
            width: 2,
            height: 65,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildMaterial({
    required String label,
    required IconData icon,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, size: 42, color: color),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF263B50),
          ),
        ),
      ],
    );
  }

  Widget _buildRod({
    required bool highlighted,
  }) {
    return Container(
      width: 90,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: highlighted
            ? Colors.orange.shade300
            : const Color(0xFF424B57),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: highlighted ? Colors.orange : Colors.black26,
          width: 2,
        ),
      ),
      child: const Text(
        'ساق المطاط',
        style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
