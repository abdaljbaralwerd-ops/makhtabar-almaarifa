import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onFinished;

  const SplashScreen({
    super.key,
    required this.onFinished,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 5), () {
      if (mounted) {
        widget.onFinished();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F6),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.menu_book_rounded,
                size: 90,
                color: Color(0xFF087F6A),
              ),

              const SizedBox(height: 24),

              const Text(
                'نِبراس',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF164B43),
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'علمٌ بلا حدود…\nبلا إنترنت، بلا مقابل',
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 19,
                  height: 1.8,
                  color: Color(0xFF52645F),
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                'تطوير: عبد الجبار الورد',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7A8984),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
