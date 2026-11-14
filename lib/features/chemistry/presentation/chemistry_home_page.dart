import 'package:flutter/material.dart';
import 'atomic_structure_page.dart';

class ChemistryHomePage extends StatelessWidget {
  const ChemistryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('كيمياء – الأول الثانوي')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('نبدأ من الذرة',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
          const SizedBox(height: 8),
          const Text(
            'مساحة تعليمية أولية لدرس تركيب الذرة. سنضيف بقية موضوعات الكتاب '
            'والتجارب تباعاً بعد مراجعة ترتيبها ومحتواها في المنهج.',
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.scatter_plot_outlined)),
              title: const Text('تركيب الذرة'),
              subtitle: const Text('تعرف على البروتون والنيوترون والإلكترون.'),
              trailing: const Icon(Icons.chevron_left),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const AtomicStructurePage(),
              )),
            ),
          ),
          const SizedBox(height: 12),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'ملاحظة: المحتوى الحالي نموذج تأسيسي. سنراجع كل درس مع صفحات '
                'الكتاب المدرسي قبل اعتماده في النسخة التعليمية.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
