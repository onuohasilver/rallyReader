import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:flutter/material.dart';

class BookShelfScreen extends StatefulWidget {
  final PdfController pdfController;
  
  const BookShelfScreen(
      { Key key,  @required this.pdfController})
      : super(key: key);
  @override
  _BookShelfScreenState createState() => _BookShelfScreenState();
}

class _BookShelfScreenState extends State<BookShelfScreen> {
  List<String> files;

  @override
  Widget build(BuildContext context) {
    double heightT = MediaQuery.of(context).size.height;
    double widthT = MediaQuery.of(context).size.width;

    return AbsorbPointer(
      child: Container(
        height: heightT,
        width: widthT,
        child: Column(
          children: <Widget>[
            Expanded(
              child: PdfView(
                documentLoader: Center(child: CircularProgressIndicator()),
                pageLoader: Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 10,
                  valueColor: AlwaysStoppedAnimation(Colors.purpleAccent),
                  backgroundColor: Colors.purple,
                )),
                renderer: (PdfPage page) => page.render(
                  width: page.width * 3,
                  height: page.height * 3,
                  format: PdfPageFormat.JPEG,
                  backgroundColor: '#ffffff',
                ),
                controller: widget.pdfController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
