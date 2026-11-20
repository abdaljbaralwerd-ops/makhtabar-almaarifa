import 'package:flutter/material.dart';

import '../../../core/constants/app_data.dart';
import '../../../core/theme/app_theme.dart';
import '../../../features/subject_home/presentation/subject_home_page.dart';

class NebrasSubjectsPage extends StatelessWidget {
  const NebrasSubjectsPage({super.key});

  static const String grade = 'الأول الثانوي';

  IconData _iconFor(String subject) {
    switch (subject) {
      case 'الفيزياء':
        return Icons.bolt_rounded;
      case 'الكيمياء':
        return Icons.science_rounded;
      case 'الأحياء':
        return Icons.eco_rounded;
      case 'الرياضيات':
        return Icons.functions_rounded;
      default:
        return Icons.menu_book_rounded;
    }
  }

  Color _colorFor(String subject) {
    switch (subject) {
      case 'الفيزياء':
        return const Color(0xFF3975A5);
      case 'الكيمياء':
        return const Color(0xFF168575);
      case 'الأحياء':
        return const Color(0xFF57945D);
      case 'الرياضيات':
        return const Color(0xFFB88632);
      default:
        return AppTheme.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text(
          'المواد الدراسية',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppTheme.primary,
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.school_rounded,
                    color: AppTheme.secondary,
                    size: 38,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'رحلتك العلمية تبدأ هنا',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 9),
                  Text(
                    'اختر مادتك، واكتشف دروسها ومفاهيمها ومعاملها التعليمية.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.7,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'الصف الأول الثانوي',
                    style: TextStyle(
                      color: AppTheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'اختر المادة',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 16),
            for (final subject in AppData.subjects)
              _SubjectCard(
                title: subject,
                icon: _iconFor(subject),
                color: _colorFor(subject),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => SubjectHomePage(
                        grade: grade,
                        subject: subject,
                      ),
                    ),
                  );
                },
              ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'نِبراس • علمٌ بلا حدود',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubjectCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _SubjectCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: const Color(0xFFE5EAE5),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(19),
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 31,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'استكشف محتوى المادة وتعلّم',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 17,
                color: Colors.black45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
