import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:flutter/material.dart';

class ReadScreen extends StatefulWidget {
  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  int currentPageNumber = 1;
  int totalPageCount = 0;
  PdfController pdfController;

  @override
  void initState() {
    pdfController = PdfController(
        document: PdfDocument.openAsset('assets/cv.pdf'),
        viewportFraction: 1.0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PdfView(
      documentLoader: Center(child: CircularProgressIndicator()),
      pageLoader: Center(child: CircularProgressIndicator()),
      onDocumentLoaded: (document) {
        setState(() {
          totalPageCount = document.pagesCount;
        });
      },
      onPageChanged: (page) {
        setState(() {
          currentPageNumber = page;
        });
      },
      controller: pdfController,
    ));
  }
}
