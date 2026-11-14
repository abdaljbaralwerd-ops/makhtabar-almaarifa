import 'package:flutter/material.dart';
import '../data/chemistry_unit.dart';

class ChemistryUnitPage extends StatelessWidget {
  const ChemistryUnitPage({
    required this.unit,
    super.key,
  });

  final ChemistryUnit unit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(unit.title)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            unit.description,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          _buildOption(
            context,
            'الكتاب المدرسي',
            'دروس الوحدة وفق الكتاب المقرر.',
            Icons.menu_book_outlined,
          ),
          _buildOption(
            context,
            'المعمل الافتراضي',
            'تجارب وأنشطة علمية تفاعلية.',
            Icons.science_outlined,
          ),
          _buildOption(
            context,
            'الدروس التفاعلية والتقويم',
            'شرح وأنشطة وأسئلة لقياس الفهم.',
            Icons.school_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(child: Icon(icon)),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
