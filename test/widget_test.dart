import 'package:flutter_test/flutter_test.dart';
import 'package:makhtabar_almaarifa/app.dart';

void main() {
  testWidgets('opens directly on first grade subjects', (tester) async {
    await tester.pumpWidget(const KnowledgeLabApp());

    expect(find.text('الأول الثانوي'), findsOneWidget);
    expect(find.text('اختر المادة'), findsOneWidget);

    expect(find.text('الفيزياء'), findsOneWidget);
    expect(find.text('الكيمياء'), findsOneWidget);
    expect(find.text('الأحياء'), findsOneWidget);
    expect(find.text('الرياضيات'), findsOneWidget);

    expect(find.text('الثاني الثانوي'), findsNothing);
    expect(find.text('الثالث الثانوي'), findsNothing);
  });
}
