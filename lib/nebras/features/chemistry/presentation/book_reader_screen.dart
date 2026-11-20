import 'package:flutter/material.dart';

import 'book_cover_screen.dart';
import 'book_intro_screen.dart';
import 'book_contents_screen.dart';

class BookReaderScreen extends StatefulWidget {
  const BookReaderScreen({super.key});

  @override
  State<BookReaderScreen> createState() => _BookReaderScreenState();
}

class _BookReaderScreenState extends State<BookReaderScreen> {
  static const int _totalPages = 3;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF102A43);
    const gold = Color(0xFFD6AD60);

    final pages = <Widget>[
      const BookCoverScreen(),
      const BookIntroScreen(),
      const BookContentsScreen(),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F1E9),
        appBar: AppBar(
          backgroundColor: navy,
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'كتاب الكيمياء',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: pages,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(22, 12, 22, 18),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الصفحة ${_currentPage + 1} من $_totalPages',
                        style: const TextStyle(
                          color: navy,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          _totalPages,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            width: index == _currentPage ? 19 : 7,
                            height: 7,
                            decoration: BoxDecoration(
                              color: index == _currentPage
                                  ? gold
                                  : const Color(0xFFD8DEE5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: LinearProgressIndicator(
                      value: (_currentPage + 1) / _totalPages,
                      minHeight: 4,
                      backgroundColor: const Color(0xFFE8E8E8),
                      valueColor: const AlwaysStoppedAnimation<Color>(gold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
