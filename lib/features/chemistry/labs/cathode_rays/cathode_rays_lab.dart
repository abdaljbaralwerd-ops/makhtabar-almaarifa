import 'package:flutter/material.dart';

class CathodeRaysLab extends StatefulWidget {
  const CathodeRaysLab({super.key});
  @override
  State<CathodeRaysLab> createState() => _CathodeRaysLabState();
}

class _CathodeRaysLabState extends State<CathodeRaysLab> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مختبر الأشعة المهبطية'), centerTitle: true),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('شاهد مسار الأشعة المهبطية داخل أنبوبة التفريغ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
            const SizedBox(height: 18),
            Container(
              height: 230,
              decoration: BoxDecoration(
                color: const Color(0xFF101C2B),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blueGrey, width: 2),
              ),
              child: CustomPaint(
                painter: _CathodeTubePainter(isOn: _isOn),
                child: const SizedBox.expand(),
              ),
            ),
            const SizedBox(height: 18),
            FilledButton.icon(
              onPressed: () => setState(() => _isOn = !_isOn),
              icon: Icon(_isOn ? Icons.power_off : Icons.power),
              label: Text(_isOn ? 'إيقاف مرور الأشعة' : 'تشغيل التفريغ الكهربائي'),
            ),
            const SizedBox(height: 12),
            Card(child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                _isOn
                    ? 'لاحظ مسار الأشعة في الأنبوبة: يظهر في هذا النموذج في خطوط مستقيمة من المهبط نحو المصعد.'
                    : 'شغّل التفريغ الكهربائي لمشاهدة نموذج مسار الأشعة داخل الأنبوبة.',
                style: const TextStyle(fontSize: 16, height: 1.7),
              ),
            )),
            const Card(child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('ملاحظة علمية', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(
                  'وفق النشاط المعروض في الكتاب، تظهر الأشعة أثناء مرور الكهرباء في أنبوبة تحتوي على غاز، وتتجه من المهبط (القطب السالب) نحو المصعد (القطب الموجب).',
                  style: TextStyle(fontSize: 15, height: 1.7),
                ),
              ]),
            )),
            const SizedBox(height: 10),
            const Text('سؤال الملاحظة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text('ما الخاصية التي يوضحها ظهور مسار الأشعة في خطوط مستقيمة؟'),
            const SizedBox(height: 8),
            const _AnswerChoice(),
          ],
        ),
      ),
    );
  }
}

class _AnswerChoice extends StatefulWidget {
  const _AnswerChoice();
  @override
  State<_AnswerChoice> createState() => _AnswerChoiceState();
}

class _AnswerChoiceState extends State<_AnswerChoice> {
  String? _answer;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RadioListTile<String>(
        value: 'straight', groupValue: _answer,
        title: const Text('تسير الأشعة في خطوط مستقيمة'),
        onChanged: (value) => setState(() => _answer = value),
      ),
      RadioListTile<String>(
        value: 'curved', groupValue: _answer,
        title: const Text('تسير الأشعة في مسار منحني'),
        onChanged: (value) => setState(() => _answer = value),
      ),
      if (_answer != null)
        Text(
          _answer == 'straight'
              ? 'إجابة صحيحة؛ هذه هي الخاصية التي يعرضها النموذج.'
              : 'حاول مرة أخرى، وراقب شكل المسار داخل الأنبوبة.',
          style: TextStyle(
            color: _answer == 'straight' ? Colors.green : Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
    ]);
  }
}

class _CathodeTubePainter extends CustomPainter {
  final bool isOn;
  const _CathodeTubePainter({required this.isOn});

  @override
  void paint(Canvas canvas, Size size) {
    final tube = Paint()
      ..color = Colors.lightBlueAccent.withOpacity(0.16)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(20, 45, size.width - 40, 140),
        const Radius.circular(70),
      ),
      tube,
    );
    canvas.drawRect(Rect.fromLTWH(48, 95, 12, 40), Paint()..color = Colors.orangeAccent);
    canvas.drawRect(Rect.fromLTWH(size.width - 62, 95, 12, 40), Paint()..color = Colors.redAccent);

    final tp = TextPainter(textDirection: TextDirection.rtl);
    void label(String value, double x, double y) {
      tp.text = TextSpan(text: value, style: const TextStyle(color: Colors.white, fontSize: 12));
      tp.layout();
      tp.paint(canvas, Offset(x, y));
    }
    label('المهبط (-)', 28, 150);
    label('المصعد (+)', size.width - 100, 150);

    if (isOn) {
      final beam = Paint()
        ..color = Colors.cyanAccent
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round;
      for (int i = 0; i < 5; i++) {
        final y = 103.0 + i * 6;
        canvas.drawLine(Offset(64, y), Offset(size.width - 68, y), beam);
      }
      final glow = Paint()
        ..color = Colors.cyanAccent.withOpacity(0.18)
        ..strokeWidth = 18
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
      canvas.drawLine(Offset(64, 115), Offset(size.width - 68, 115), glow);
    }
  }

  @override
  bool shouldRepaint(covariant _CathodeTubePainter oldDelegate) => oldDelegate.isOn != isOn;
}
