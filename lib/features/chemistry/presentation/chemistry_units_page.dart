import 'package:flutter/material.dart';
import '../data/chemistry_units.dart';
import 'chemistry_unit_page.dart';

class ChemistryUnitsPage extends StatelessWidget {
  const ChemistryUnitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('وحدات الكيمياء'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'اختر الوحدة الدراسية',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          for (final unit in chemistryUnits)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(14),
                leading: const CircleAvatar(
                  child: Icon(Icons.science_outlined),
                ),
                title: Text(
                  unit.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(unit.description),
                trailing: const Icon(Icons.chevron_left),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ChemistryUnitPage(unit: unit),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
