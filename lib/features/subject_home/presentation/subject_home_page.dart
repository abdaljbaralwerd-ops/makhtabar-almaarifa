import 'package:flutter/material.dart';
import '../../../shared/widgets/section_card.dart';
import '../../../nebras/features/chemistry/presentation/book_reader_screen.dart';

class SubjectHomePage extends StatelessWidget {
  const SubjectHomePage({
    required this.grade,
    required this.subject,
    super.key,
  });

  final String grade;
  final String subject;

  @override
  Widget build(BuildContext context) {
    final isFirstYearChemistry =
        grade == 'الأول الثانوي' && subject == 'الكيمياء';

    if (isFirstYearChemistry) {
      return const BookReaderScreen();
    }

    return Scaffold(
      appBar: AppBar(title: Text(subject)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(grade, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            'ماذا تريد أن تفتح؟',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 18),
          SectionCard(
            title: 'الكتاب المدرسي',
            subtitle: 'تصفح الكتاب والدروس وفق المنهج.',
            icon: Icons.menu_book_outlined,
            onTap: () => _showInfo(
              context,
              'سيُربط ملف الكتاب المدرسي في المرحلة التالية.',
            ),
          ),
          SectionCard(
            title: 'المعمل الافتراضي',
            subtitle: 'اختر تجربة وتعرّف على أدواتها وخطواتها.',
            icon: Icons.science_outlined,
            onTap: () => _showInfo(
              context,
              'سيُضاف المعمل لهذه المادة والصف لاحقاً.',
            ),
          ),
          SectionCard(
            title: 'الدروس التفاعلية',
            subtitle: 'شرح مبسط وأنشطة وأسئلة قصيرة.',
            icon: Icons.school_outlined,
            onTap: () => _showInfo(
              context,
              'ستُضاف الدروس التفاعلية لاحقاً.',
            ),
          ),
        ],
      ),
    );
  }

  void _showInfo(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
