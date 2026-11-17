import 'package:flutter/material.dart';

class PhlogistonLabPage extends StatefulWidget {
  const PhlogistonLabPage({super.key});

  @override
  State<PhlogistonLabPage> createState() => _PhlogistonLabPageState();
}

class _PhlogistonLabPageState extends State<PhlogistonLabPage> {
  static const Color primary = Color(0xFF176B5B);
  static const double initialMetalMass = 10;
  static const double addedOxygenMass = 2.5;

  bool heated = false;
  bool showExplanation = false;
  int? selectedAnswer;
  bool answerSubmitted = false;

  double get productMass =>
      initialMetalMass + (heated ? addedOxygenMass : 0);

  void _runExperiment() {
    setState(() {
      heated = true;
      showExplanation = true;
    });
  }

  void _resetExperiment() {
    setState(() {
      heated = false;
      showExplanation = false;
      selectedAnswer = null;
      answerSubmitted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مختبر نظرية الفلوجستون'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildGuidance(),
          const SizedBox(height: 16),
          _buildExperimentPanel(),
          const SizedBox(height: 16),
          _buildControls(),
          const SizedBox(height: 16),
          _buildMassBalance(),
          if (showExplanation) ...[
            const SizedBox(height: 16),
            _buildResult(),
            const SizedBox(height: 16),
            _buildKnowledgeCheck(),
          ],
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.science, color: Colors.white, size: 30),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'تجربة تكليس الفلزات',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'هل تفقد الفلزات كتلتها عند التسخين، أم تكتسب كتلة؟ '
            'اكتشف ذلك من خلال المحاكاة.',
            style: TextStyle(color: Colors.white, height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _buildGuidance() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.menu_book, color: primary),
                SizedBox(width: 8),
                Text(
                  'إرشادات المختبر',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _guidanceRow(
              Icons.flag_outlined,
              'الهدف',
              'ملاحظة تغير كتلة الفلز عند اتحاده بالأكسجين.',
            ),
            _guidanceRow(
              Icons.science_outlined,
              'الأدوات الافتراضية',
              'عينة فلز، وعاء تفاعل، ومصدر تسخين افتراضي.',
            ),
            _guidanceRow(
              Icons.format_list_numbered,
              'خطوات العمل',
              'لاحظ الكتلة الابتدائية، ثم شغّل المحاكاة، '
                  'وقارن الكتلة النهائية.',
            ),
            _guidanceRow(
              Icons.shield_outlined,
              'تنبيه السلامة',
              'هذه محاكاة رقمية فقط، ولا تتطلب استخدام نار '
                  'أو مواد كيميائية حقيقية.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _guidanceRow(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: primary, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 3),
                Text(description, style: const TextStyle(height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperimentPanel() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'منضدة التجربة',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: heated
                    ? Colors.orange.withOpacity(0.10)
                    : Colors.blueGrey.withOpacity(0.07),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: heated ? Colors.orange : Colors.blueGrey.shade200,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    heated ? Icons.whatshot : Icons.science_outlined,
                    size: 58,
                    color: heated ? Colors.deepOrange : primary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    heated ? 'اكتمل التفاعل الافتراضي' : 'العينة قبل التسخين',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: Text(
                      heated
                          ? 'اتحدت العينة مع الأكسجين'
                          : 'عينة فلز كتلتها 10 غرامات',
                      key: ValueKey(heated),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      heated ? 'الناتج: أكسيد الفلز' : 'حالة التجربة: جاهزة',
                      style: const TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              heated
                  ? 'لاحظ أن كتلة الناتج أصبحت أكبر بسبب اتحاد الفلز بالأكسجين.'
                  : 'اضغط على تشغيل التجربة لمشاهدة نتيجة المحاكاة.',
              textAlign: TextAlign.center,
              style: const TextStyle(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: heated ? null : _runExperiment,
            icon: const Icon(Icons.play_arrow),
            label: const Text('تشغيل التجربة'),
            style: FilledButton.styleFrom(
              backgroundColor: primary,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),
        const SizedBox(width: 10),
        OutlinedButton.icon(
          onPressed: _resetExperiment,
          icon: const Icon(Icons.refresh),
          label: const Text('إعادة'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildMassBalance() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ميزان الكتلة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            _massRow('كتلة الفلز', initialMetalMass, Icons.circle_outlined),
            _massRow(
              'كتلة الأكسجين المتحد',
              heated ? addedOxygenMass : 0,
              Icons.air,
            ),
            const Divider(height: 24),
            _massRow(
              'كتلة الناتج',
              productMass,
              Icons.scale_outlined,
              highlight: true,
            ),
            const SizedBox(height: 8),
            Text(
              heated
                  ? '10 + 2.5 = 12.5 غراماً'
                  : 'لم تبدأ المحاكاة بعد.',
              style: const TextStyle(color: primary, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _massRow(
    String label,
    double mass,
    IconData icon, {
    bool highlight = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Icon(icon, color: highlight ? primary : Colors.blueGrey),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Text(
            '${mass.toStringAsFixed(1)} غ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: highlight ? primary : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResult() {
    return Card(
      color: primary.withOpacity(0.07),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ماذا تعني النتيجة؟',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'عند تسخين الفلز في وجود الأكسجين يتحد معه، '
              'فتزداد كتلة المادة الناتجة عن كتلة الفلز وحده.',
              style: TextStyle(height: 1.7),
            ),
            const SizedBox(height: 10),
            const Text(
              'كانت نظرية الفلوجستون التاريخية تفترض أن المواد تطلق '
              'مادة تسمى الفلوجستون عند الاحتراق. لكن زيادة كتلة الفلز '
              'بعد اتحاده بالأكسجين كانت من الأدلة التي ساعدت على '
              'إضعاف هذه النظرية وتجاوزها.',
              style: TextStyle(height: 1.7),
            ),
            const SizedBox(height: 10),
            const Text(
              'استنتاج: الأكسجين المتحد مع الفلز يضيف كتلة إلى الناتج.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primary,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'ملاحظة: الأرقام في هذه المحاكاة تعليمية افتراضية، '
              'وليست قياسات تجربة مخبرية محددة.',
              style: TextStyle(fontSize: 12, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKnowledgeCheck() {
    const answers = [
      'تزداد كتلة الناتج بسبب اتحاد الفلز بالأكسجين.',
      'تختفي كتلة الفلز بالكامل.',
      'تبقى كتلة الناتج صفراً.',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اختبر فهمك',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'لماذا أصبحت كتلة الناتج في المحاكاة أكبر من كتلة الفلز؟',
            ),
            const SizedBox(height: 8),
            ...List.generate(answers.length, (index) {
              return RadioListTile<int>(
                value: index,
                groupValue: selectedAnswer,
                contentPadding: EdgeInsets.zero,
                title: Text(answers[index]),
                onChanged: answerSubmitted
                    ? null
                    : (value) => setState(() => selectedAnswer = value),
              );
            }),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: selectedAnswer == null || answerSubmitted
                    ? null
                    : () => setState(() => answerSubmitted = true),
                child: const Text('تحقق من الإجابة'),
              ),
            ),
            if (answerSubmitted) ...[
              const SizedBox(height: 12),
              Text(
                selectedAnswer == 0
                    ? 'أحسنت! الأكسجين المتحد أضاف كتلته إلى كتلة الفلز.'
                    : 'ليست الإجابة الصحيحة. تذكّر دور الأكسجين في تكوين الناتج.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedAnswer == 0 ? Colors.green : Colors.deepOrange,
                ),
              ),
              TextButton(
                onPressed: () => setState(() {
                  selectedAnswer = null;
                  answerSubmitted = false;
                }),
                child: const Text('أعد المحاولة'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
