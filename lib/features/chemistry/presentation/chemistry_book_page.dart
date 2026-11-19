import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

class ChemistryBookPage extends StatefulWidget {
  const ChemistryBookPage({
    super.key,
    this.bookAsset = unit1BookAsset,
    this.bookTitle = unit1BookTitle,
  });

  static const String unit1BookAsset =
      'assets/books/chemistry_unit_01.pdf';
  static const String unit1BookTitle = 'علم الكيمياء وتطوره';

  final String bookAsset;
  final String bookTitle;

  @override
  State<ChemistryBookPage> createState() => _ChemistryBookPageState();
}

class _ChemistryBookPageState extends State<ChemistryBookPage> {
  static const Color primaryColor = Color(0xFF176B5B);
  static const Color backgroundColor = Color(0xFFF6F8F7);

  final PdfViewerController _controller = PdfViewerController();

  int _currentPage = 1;
  int _totalPages = 0;
  bool _isReady = false;

  void _onViewerReady(
    PdfDocument document,
    PdfViewerController controller,
  ) {
    if (!mounted) return;

    setState(() {
      _totalPages = document.pages.length;
      _currentPage = controller.pageNumber ?? 1;
      _isReady = true;
    });
  }

  void _onPageChanged(int? pageNumber) {
    if (!mounted || pageNumber == null) return;
    setState(() => _currentPage = pageNumber);
  }

  Future<void> _goToPage(int page) async {
    if (!_isReady || page < 1 || page > _totalPages) return;
    await _controller.goToPage(pageNumber: page);
  }

  Future<void> _showPagePicker() async {
    if (!_isReady) return;

    final pageController = TextEditingController(
      text: _currentPage.toString(),
    );

    final selectedPage = await showDialog<int>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('الانتقال إلى صفحة'),
        content: TextField(
          controller: pageController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'رقم الصفحة',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            helperText: 'عدد صفحات الوحدة: $_totalPages',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('إلغاء'),
          ),
          FilledButton(
            onPressed: () {
              final page = int.tryParse(pageController.text.trim());

              if (page == null || page < 1 || page > _totalPages) {
                ScaffoldMessenger.of(dialogContext).showSnackBar(
                  SnackBar(
                    content: Text('أدخل رقمًا من 1 إلى $_totalPages'),
                  ),
                );
                return;
              }

              Navigator.pop(dialogContext, page);
            },
            child: const Text('انتقال'),
          ),
        ],
      ),
    );

    pageController.dispose();

    if (selectedPage != null) {
      await _goToPage(selectedPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'الكتاب المدرسي',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        foregroundColor: const Color(0xFF173D36),
      ),
      body: Column(
        children: [
          _buildBookToolbar(),
          Expanded(
            child: Stack(
              children: [
                PdfViewer.asset(
                  widget.bookAsset,
                  controller: _controller,
                  params: PdfViewerParams(
                    backgroundColor: backgroundColor,
                    onViewerReady: _onViewerReady,
                    onPageChanged: _onPageChanged,

                  ),
                ),
                if (!_isReady)
                  const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(color: primaryColor),
                        SizedBox(height: 16),
                        Text('جارٍ تجهيز الكتاب...'),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          _buildPageNavigation(),
        ],
      ),
    );
  }

  Widget _buildBookToolbar() {
    return Container(
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFE5ECE9)),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.menu_book_rounded, color: primaryColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.bookTitle,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF173D36),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            tooltip: 'الانتقال إلى صفحة',
            onPressed: _isReady ? _showPagePicker : null,
            icon: const Icon(
              Icons.find_in_page_outlined,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE5ECE9)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton.filledTonal(
            tooltip: 'الصفحة السابقة',
            onPressed: _isReady && _currentPage > 1
                ? () => _goToPage(_currentPage - 1)
                : null,
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          InkWell(
            onTap: _showPagePicker,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              child: Text(
                _isReady
                    ? 'صفحة $_currentPage من $_totalPages'
                    : 'جارٍ تحميل الصفحات',
                style: const TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          IconButton.filledTonal(
            tooltip: 'الصفحة التالية',
            onPressed: _isReady && _currentPage < _totalPages
                ? () => _goToPage(_currentPage + 1)
                : null,
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
