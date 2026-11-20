import 'package:flutter_test/flutter_test.dart';
import 'package:makhtabar_almaarifa/app.dart';

void main() {
testWidgets('shows Nebras splash and home page', (tester) async {
await tester.pumpWidget(const KnowledgeLabApp());

// التحقق من شاشة البداية
expect(find.text('نِبراس'), findsOneWidget);
expect(find.text('علمٌ بلا حدود…\nبلا إنترنت، بلا مقابل'), findsOneWidget);
expect(find.text('تطوير: عبد الجبار الورد'), findsOneWidget);

// انتظار انتهاء شاشة البداية
await tester.pump(const Duration(seconds: 5));
await tester.pumpAndSettle();

// التحقق من الصفحة الرئيسية
expect(find.text('مرحباً بك في نِبراس'), findsOneWidget);
expect(find.text('مساحتك التعليمية'), findsOneWidget);
expect(find.text('المواد الدراسية'), findsOneWidget);
expect(find.text('الدروس والشروحات'), findsOneWidget);
expect(find.text('المعامل الافتراضية'), findsOneWidget);

});
}
