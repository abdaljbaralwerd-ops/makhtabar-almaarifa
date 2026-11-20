import 'package:flutter/material.dart';

import '../../../../core/models/experiment_model.dart';
import 'workbench_scene.dart';

class StaticElectricityLab extends StatefulWidget {
  const StaticElectricityLab({super.key});

  static const ExperimentModel experiment = ExperimentModel(
    id: 'static_electricity_01',
    title: 'معمل الكهرباء الساكنة',
    description: 'استكشاف تأثير الدلك الكهربائي في الأجسام القريبة.',
    labRoute: 'static_electricity',
    tools: [
      'بالونان',
      'ساق مطاط',
      'قطعة صوف',
      'قطعة حرير',
      'خيطان للتعليق',
    ],
    learningObjective: 'التعرف على الشحن الكهربائي بالدلك والاستقطاب.',
  );

  @override
  State<StaticElectricityLab> createState() =>
      _StaticElectricityLabState();
}

class _StaticElectricityLabState extends State<StaticElectricityLab> {
  bool _isRubbed = false;
  String? _rubbingMaterial;
  String? _quizAnswer;
  bool _isNearBalloons = false;

  void _rubRod(String material) {
    setState(() {
      _isRubbed = true;
      _rubbingMaterial = material;
      _isNearBalloons = false;
    });
  }

  void _updateProximity(bool isNear) {
    if (_isNearBalloons == isNear) return;

    setState(() {
      _isNearBalloons = isNear;
    });
  }

  void _resetExperiment() {
    setState(() {
      _isRubbed = false;
      _rubbingMaterial = null;
      _quizAnswer = null;
      _isNearBalloons = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('معمل الكهرباء الساكنة'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _resetExperiment,
            icon: const Icon(Icons.refresh),
            tooltip: 'إعادة التجربة',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: WorkbenchScene(
              isRubbed: _isRubbed,
              onRub: _rubRod,
              onProximityChanged: _updateProximity,
              onReset: _resetExperiment,
            ),
          ),
          _buildStatusPanel(),
          if (_isNearBalloons) _buildScientificNote(),
          if (_isNearBalloons) _buildQuickQuestion(),
        ],
      ),
    );
  }

  Widget _buildQuickQuestion() {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text("اختبر فهمك: لماذا انجذب البالونان؟",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: const Text("استقطاب الشحنات"),
                  selected: _quizAnswer == "correct",
                  onSelected: (_) => setState(() => _quizAnswer = "correct"),
                ),
                ChoiceChip(
                  label: const Text("زيادة وزن البالونين"),
                  selected: _quizAnswer == "wrong",
                  onSelected: (_) => setState(() => _quizAnswer = "wrong"),
                ),
              ],
            ),
            if (_quizAnswer != null)
              Text(_quizAnswer == "correct"
                  ? "أحسنت! هذا هو التفسير الصحيح."
                  : "حاول مجددًا: فكر في إعادة توزيع الشحنات."),
          ],
        ),
      ),
    );
  }

  Widget _buildScientificNote() {
    return Card(
      margin: const EdgeInsets.all(12),
      color: const Color(0xFFE3F2FD),
      child: const Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Text("التفسير العلمي", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            SizedBox(height: 8),
            Text("عند اقتراب الساق المشحونة من البالونين، يعاد توزيع الشحنات في الغلاف المعدني، فينشأ استقطاب كهربائي يؤدي إلى التجاذب."),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusPanel() {
    final String message;

    if (!_isRubbed) {
      message = 'ابدأ التجربة بدلك ساق المطاط بقطعة الصوف أو الحرير.';
    } else if (_isNearBalloons) {
      message = 'لاحظ انجذاب البالونين نحو الساق بعد الدلك بقطعة ${_rubbingMaterial == "silk" ? "الحرير." : "الصوف."}';
    } else {
      message = 'قرّب ساق المطاط بعد دلكها بقطعة ${_rubbingMaterial == "silk" ? "الحرير" : "الصوف"} من البالونين.';
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFEAF2F8),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color(0xFF263B50),
        ),
      ),
    );
  }
}
