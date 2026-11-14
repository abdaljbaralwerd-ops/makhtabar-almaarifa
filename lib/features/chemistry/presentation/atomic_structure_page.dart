import 'package:flutter/material.dart';

class AtomicStructurePage extends StatefulWidget {
  const AtomicStructurePage({super.key});

  @override
  State<AtomicStructurePage> createState() => _AtomicStructurePageState();
}

class _AtomicStructurePageState extends State<AtomicStructurePage> {
  final List<_Particle> particles = const [
    _Particle(
      name: 'البروتون',
      charge: 'موجبة (+)',
      location: 'داخل النواة',
      description: 'عدد البروتونات يحدد العدد الذري للعنصر.',
      icon: Icons.add_circle,
    ),
    _Particle(
      name: 'النيوترون',
      charge: 'متعادلة (0)',
      location: 'داخل النواة',
      description: 'يوجد مع البروتونات داخل نواة الذرة.',
      icon: Icons.circle,
    ),
    _Particle(
      name: 'الإلكترون',
      charge: 'سالبة (-)',
      location: 'حول النواة',
      description: 'يوجد حول النواة ضمن مستويات الطاقة.',
      icon: Icons.remove_circle,
    ),
  ];

  int selected = 0;
  int? answer;
  bool submitted = false;

  @override
  Widget build(BuildContext context) {
    final particle = particles[selected];
    return Scaffold(
      appBar: AppBar(title: const Text('تركيب الذرة')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('استكشف مكونات الذرة',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
          const SizedBox(height: 8),
          const Text(
            'اختر أحد الجسيمات لتظهر لك شحنته وموقعه ووظيفته التعليمية.',
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(particles.length, (index) {
              return ChoiceChip(
                label: Text(particles[index].name),
                selected: selected == index,
                onSelected: (_) => setState(() => selected = index),
              );
            }),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(particle.icon, size: 54,
                      color: Theme.of(context).colorScheme.primary),
                  const SizedBox(height: 12),
                  Text(particle.name,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  _InfoRow(label: 'الشحنة', value: particle.charge),
                  _InfoRow(label: 'الموقع', value: particle.location),
                  const SizedBox(height: 8),
                  Text(particle.description,
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          const SizedBox(height: 22),
          Text('اختبر فهمك', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          const Text('أي جسيم من الجسيمات التالية يحمل شحنة سالبة؟'),
          const SizedBox(height: 8),
          ...['البروتون', 'النيوترون', 'الإلكترون'].asMap().entries.map((entry) {
            return RadioListTile<int>(
              value: entry.key,
              groupValue: answer,
              title: Text(entry.value),
              onChanged: submitted ? null : (value) => setState(() => answer = value),
            );
          }),
          FilledButton(
            onPressed: answer == null
                ? null
                : () => setState(() => submitted = true),
            child: const Text('تحقق من الإجابة'),
          ),
          if (submitted)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                answer == 2
                    ? 'أحسنت! الإلكترون يحمل شحنة سالبة.'
                    : 'حاول مرة أخرى. تذكّر أن الإلكترون سالب الشحنة.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: answer == 2 ? Colors.green : Colors.deepOrange,
                ),
              ),
            ),
          TextButton(
            onPressed: () => setState(() {
              answer = null;
              submitted = false;
              selected = 0;
            }),
            child: const Text('إعادة النشاط'),
          ),
          const SizedBox(height: 8),
          const Text(
            'تنبيه علمي: هذه شاشة تعريفية مبسطة وليست محاكاة ذرية ثلاثية الأبعاد '
            'أو تمثيلاً لمقياس أحجام الجسيمات ومسافاتها.',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _Particle {
  const _Particle({
    required this.name,
    required this.charge,
    required this.location,
    required this.description,
    required this.icon,
  });

  final String name;
  final String charge;
  final String location;
  final String description;
  final IconData icon;
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(value),
          ],
        ),
      );
}
