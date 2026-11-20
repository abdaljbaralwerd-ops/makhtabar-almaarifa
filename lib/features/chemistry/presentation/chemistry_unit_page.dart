import 'package:flutter/material.dart';

import '../data/chemistry_unit.dart';
import 'phlogiston_lab_page.dart';
import '../labs/static_electricity/static_electricity_lab.dart';
import '../labs/cathode_rays/cathode_rays_lab.dart';

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
            'المعمل الافتراضي',
            'تجارب وأنشطة علمية تفاعلية.',
            Icons.science_outlined,
            onTap: unit.id == 'unit_1' || unit.id == 'unit_2'
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => unit.id == 'unit_2'
                            ? const StaticElectricityLab()
                            : const PhlogistonLabPage(),
                      ),
                    );
                  }
                : null,
          ),
          if (unit.id == 'unit_2')
            _buildOption(
              context,
              'مختبر الأشعة المهبطية',
              'محاكاة أنبوبة التفريغ وملاحظة مسار الأشعة.',
              Icons.bolt,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CathodeRaysLab(),
                  ),
                );
              },
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
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(child: Icon(icon)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
