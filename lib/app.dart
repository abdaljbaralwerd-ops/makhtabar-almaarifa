import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'splash_screen.dart';
import 'nebras/features/home/nebras_home_page.dart';

class KnowledgeLabApp extends StatelessWidget {
  const KnowledgeLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نِبراس',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      locale: const Locale('ar'),
      home: Builder(
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: SplashScreen(
              onFinished: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                    builder: (_) => const NebrasHomePage(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
