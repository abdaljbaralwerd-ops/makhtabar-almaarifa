import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/home_page.dart';

class KnowledgeLabApp extends StatelessWidget {
  const KnowledgeLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مختبر المعرفة',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      locale: const Locale('ar'),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(),
      ),
    );
  }
}
