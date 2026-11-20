import 'package:flutter/material.dart';

import '../data/chemistry_book_data.dart';

class BookCoverScreen extends StatelessWidget {
  const BookCoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF102A43);
    const gold = Color(0xFFD6AD60);

    return Container(
      color: const Color(0xFFF4F1E9),
      padding: const EdgeInsets.all(22),
      child: Center(
        child: AspectRatio(
          aspectRatio: 0.70,
          child: Container(
            decoration: BoxDecoration(
              color: navy,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: gold, width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 18,
                  offset: Offset(0, 9),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: _CoverPatternPainter(color: gold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.science_outlined,
                            color: gold,
                            size: 54,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'نِبراس',
                            style: TextStyle(
                              color: gold,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Container(
                            width: 65,
                            height: 2,
                            color: gold,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'الكتاب المدرسي',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            ChemistryBookData.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            ChemistryBookData.subtitle,
                            style: const TextStyle(
                              color: gold,
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 45,
                            height: 1,
                            color: gold,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'رحلة في عالم المادة والتفاعلات',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 22),
                          const Text(
                            'عبد الجبار الورد',
                            style: TextStyle(
                              color: gold,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CoverPatternPainter extends CustomPainter {
  final Color color;

  const _CoverPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (double x = -size.height; x < size.width; x += 35) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x + size.height, size.height),
        paint,
      );
    }

    final center = Offset(size.width / 2, size.height / 2);
    for (double radius = 35; radius < size.width; radius += 45) {
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _CoverPatternPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
