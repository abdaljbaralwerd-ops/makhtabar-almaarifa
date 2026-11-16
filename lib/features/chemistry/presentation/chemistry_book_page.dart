import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

class ChemistryBookPage extends StatelessWidget {
  const ChemistryBookPage({super.key});

  static const String bookAsset =
      'assets/books/chemistry_unit_01.pdf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الكتاب المدرسي'),
        centerTitle: true,
      ),
      body: PdfViewer.asset(bookAsset),
    );
  }
}
