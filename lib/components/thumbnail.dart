import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:rallyreader/components/colorFlatButton.dart';
import 'package:rallyreader/components/progressIndicator.dart';
import 'bookImage.dart';

class ThumbNail extends StatelessWidget {
  const ThumbNail(
      {@required this.heightT,
      @required this.widthT,
      @required this.pdfController,
      @required this.key})
      : super(key: key);

  final double heightT;
  final double widthT;
  final GlobalKey key;

  final PdfController pdfController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          BookImage(
            key: key,
            shadow: false,
            heightT: heightT,
            widthT: widthT,
            pdfController: pdfController,
          ),
          // SizedBox(
          //   height: heightT * .014,
          // ),
          // CurvedLinearProgressIndicator(
          //   widthT: widthT * .6,
          //   heightT: heightT,
          //   value: .45,
          //   read: false,
          // )
        ],
      ),
    );
  }
}

class ExpandedThumbnail extends StatelessWidget {
  const ExpandedThumbnail(
      {@required this.heightT,
      @required this.widthT,
      @required this.title,
      @required this.pdfController,
      @required this.completion,
      @required this.key,
      this.onTap})
      : super(key: key);

  final double heightT;
  final double widthT;
  final String title;
  final double completion;
  final PdfController pdfController;
  final Function onTap;
  final GlobalKey key;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            BookImage(
              key: key,
              shadow: false,
              heightT: heightT,
              widthT: widthT,
              pdfController: pdfController,
              onTap: onTap,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      title,
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.hindMadurai(
                          fontSize: heightT * .022,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Container(
                        width: widthT * .55,
                        child: CurvedLinearProgressIndicator(
                            widthT: widthT * 1.8,
                            value: completion,
                            read: false,
                            readColor: Colors.orange)),
                  ),
                  Container(
                      width: widthT * .55,
                      height: heightT * .05,
                      child: ColorFlatButton(
                        color: Colors.orange,
                        widthT: double.infinity,
                        heightT: heightT * .3,
                        label: 'Read Book',
                        onTap: onTap,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
