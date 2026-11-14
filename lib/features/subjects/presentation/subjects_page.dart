import 'package:flutter/material.dart';
import '../../../core/constants/app_data.dart';
import '../../subject_home/presentation/subject_home_page.dart';

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({required this.grade, super.key});
  final String grade;

  IconData _iconFor(String subject) {
    switch (subject) {
      case 'الفيزياء': return Icons.bolt_outlined;
      case 'الكيمياء': return Icons.science_outlined;
      case 'الأحياء': return Icons.eco_outlined;
      default: return Icons.functions_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(grade)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('اختر المادة', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 14),
          for (final subject in AppData.subjects)
            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(14),
                leading: CircleAvatar(child: Icon(_iconFor(subject))),
                title: Text(subject),
                trailing: const Icon(Icons.chevron_left),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SubjectHomePage(grade: grade, subject: subject),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
