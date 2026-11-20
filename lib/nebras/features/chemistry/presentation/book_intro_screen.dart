import 'package:flutter/material.dart';

import '../data/chemistry_book_data.dart';

class BookIntroScreen extends StatelessWidget {
  const BookIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF102A43);
    const gold = Color(0xFFD6AD60);

    return Container(
      color: const Color(0xFFF4F1E9),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.auto_stories_outlined,
                size: 42,
                color: navy,
              ),
              const SizedBox(height: 16),
              const Text(
                'مقدمة الرحلة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: navy,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Container(
                  width: 55,
                  height: 3,
                  decoration: BoxDecoration(
                    color: gold,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFE7DFD0)),
                ),
                child: Text(
                  ChemistryBookData.introduction,
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    color: Color(0xFF34495E),
                    fontSize: 18,
                    height: 2.0,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: navy,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: gold,
                      size: 30,
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        'كل اكتشاف عظيم يبدأ بسؤال.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
