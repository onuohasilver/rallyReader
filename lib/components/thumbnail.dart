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
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
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
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: heightT * .05,
                      width: widthT * .6,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: GoogleFonts.hindMadurai(
                            fontSize: heightT * .018,
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
                        height: heightT * .04,
                        // child: ColorFlatButton(
                        //   color: Colors.orange,
                        //   widthT: double.infinity,
                        //   heightT: heightT * .3,
                        //   label: 'Explore',
                        //   onTap: onTap,
                        // ))
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(Icons.favorite_border),
                            Icon(Icons.av_timer,
                            ),
                            Icon(Icons.library_books),
                          ],
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
