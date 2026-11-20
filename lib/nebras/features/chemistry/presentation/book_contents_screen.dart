import 'package:flutter/material.dart';

import '../data/chemistry_book_data.dart';

class BookContentsScreen extends StatelessWidget {
  const BookContentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF102A43);
    const gold = Color(0xFFD6AD60);

    return Container(
      color: const Color(0xFFF4F1E9),
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 24, 20, 18),
              child: Column(
                children: [
                  Icon(Icons.format_list_numbered_rounded,
                      color: navy, size: 38),
                  SizedBox(height: 10),
                  Text(
                    'فهرس الكتاب',
                    style: TextStyle(
                      color: navy,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'تعرّف على محطات رحلتك في عالم الكيمياء',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF687B8D),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                itemCount: ChemistryBookData.units.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final unit = ChemistryBookData.units[index];

                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: const Color(0xFFE7DFD0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: navy,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${unit.number}',
                            style: const TextStyle(
                              color: gold,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 13),
                        Expanded(
                          child: Text(
                            unit.title,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              color: navy,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          children: [
                            const Icon(
                              Icons.menu_book_outlined,
                              color: gold,
                              size: 19,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${unit.page}',
                              style: const TextStyle(
                                color: Color(0xFF687B8D),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
