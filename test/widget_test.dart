import 'package:flutter_test/flutter_test.dart';
import 'package:makhtabar_almaarifa/app.dart';

void main() {
  testWidgets('shows app title and grade choices', (tester) async {
    await tester.pumpWidget(const KnowledgeLabApp());
    expect(find.text('مختبر المعرفة'), findsOneWidget);
    expect(find.text('الأول الثانوي'), findsOneWidget);
    expect(find.text('الثاني الثانوي'), findsOneWidget);
    expect(find.text('الثالث الثانوي'), findsOneWidget);
  });
}
