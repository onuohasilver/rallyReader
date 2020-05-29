import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:rallyreader/components/colorFlatButton.dart';

import 'landingScreen.dart';

class ReadScreen extends StatefulWidget {
  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  int currentPageNumber = 1;
  int totalPageCount = 0;
  double sliderValue = 0;
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
    double heightT = MediaQuery.of(context).size.height;
    double widthT = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Expanded(
              child: PdfView(
                documentLoader: Center(child: CircularProgressIndicator()),
                pageLoader: Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 105,
                  valueColor: AlwaysStoppedAnimation(Colors.purpleAccent),
                  backgroundColor: Colors.purple,
                )),
                renderer: (PdfPage page) => page.render(
                  width: page.width * 3,
                  height: page.height * 3,
                  format: PdfPageFormat.JPEG,
                  backgroundColor: '#ffffff',
                ),
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
              ),
            ),
          ),
          Container(
            width: widthT,
            height: heightT * .1,
            color: Color(0xFF574497).withOpacity(.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ColorFlatButton(
                  widthT: widthT,
                  heightT: heightT,
                  label: 'Previous Page',
                  onTap: () {
                    pdfController.previousPage(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeOut);
                  },
                ),
                Container(
                  width: widthT * .2,
                  height: heightT * .1,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.purpleAccent,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LandingScreen();
                            },
                          ),
                        );
                      },
                      child: Icon(Icons.home, color: Colors.white, size: 40),
                    ),
                  ),
                ),
                ColorFlatButton(
                  widthT: widthT,
                  heightT: heightT,
                  label: 'Next Page',
                  onTap: () {
                    pdfController.nextPage(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeIn);
                  },
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
