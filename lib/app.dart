import 'package:flutter/material.dart';
import 'core/config/app_config.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/splash_page.dart';

class KnowledgeLabApp extends StatelessWidget {
  const KnowledgeLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      locale: const Locale('ar'),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: SplashPage(),
      ),
    );
  }
}
