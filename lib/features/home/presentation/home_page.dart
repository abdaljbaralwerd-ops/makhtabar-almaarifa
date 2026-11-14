import 'package:flutter/material.dart';
import '../../../core/constants/app_data.dart';
import '../../subjects/presentation/subjects_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مختبر المعرفة')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 12),
          Text(
            'مرحباً بك في مختبر المعرفة',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF173D36),
                ),
          ),
          const SizedBox(height: 8),
          const Text('اختر صفك الدراسي لنبدأ رحلة التعلم والتجربة.'),
          const SizedBox(height: 24),
          Text('اختر الصف', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          for (final grade in AppData.grades)
            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18, vertical: 8,
                ),
                leading: const CircleAvatar(child: Icon(Icons.school_outlined)),
                title: Text(grade),
                trailing: const Icon(Icons.arrow_back_ios_new, size: 16),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SubjectsPage(grade: grade),
                  ),
                ),
              ),
            ),
          const SizedBox(height: 24),
          const Text(
            'نسخة تأسيسية أولية — ستُضاف الكتب والتجارب والدروس تدريجياً.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
