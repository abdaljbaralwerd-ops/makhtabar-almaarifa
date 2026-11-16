import 'package:flutter_test/flutter_test.dart';
import 'package:makhtabar_almaarifa/app.dart';

void main() {
  testWidgets('shows the knowledge lab splash screen', (tester) async {
    await tester.pumpWidget(const KnowledgeLabApp());

    expect(find.text('مختبر المعرفة'), findsOneWidget);
    expect(find.text('اكتشف .. جرّب .. تعلّم'), findsOneWidget);
    expect(find.text('ابدأ رحلة المعرفة'), findsOneWidget);
    expect(find.text('برمجة وتطوير'), findsOneWidget);
    expect(find.text('عبدالجبار الورد'), findsOneWidget);
    expect(find.text('الأول الثانوي'), findsOneWidget);
  });
}
