import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:rallyreader/components/colorFlatButton.dart';
import 'package:rallyreader/components/progressIndicator.dart';

import 'bookImage.dart';

class ThumbNail extends StatelessWidget {
  const ThumbNail(
      {Key key,
      @required this.heightT,
      @required this.widthT,
      @required this.pdfController,
      @required this.keyString})
      : super(key: key);

  final double heightT;
  final double widthT;
  final String keyString;

  final PdfController pdfController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          BookImage(
            keyString: keyString,
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
      {Key key,
      @required this.heightT,
      @required this.widthT,
      @required this.title,
      @required this.pages,
      @required this.rating,
      @required this.pdfController,
      @required this.favorite,
      @required this.completion,
      @required this.keyString,
      this.onTap})
      : super(key: key);

  final double heightT;
  final double widthT;
  final String title;

  final int pages;
  final double rating;
  final int favorite;
  final double completion;
  final PdfController pdfController;
  final Function onTap;
  final String keyString;

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
              keyString: keyString,
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
                  Text(
                    title,
                    style: GoogleFonts.hindMadurai(
                        fontSize: heightT * .022, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Container(
                      width: widthT * .54,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: heightT * .04,
                            width: widthT * .16,
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              child: Center(
                                  child: Text(
                                '$pages L',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )),
                              color: Colors.lightGreen,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.deepOrange,
                                ),
                                Text(
                                  '$rating',
                                  style: TextStyle(color: Colors.black87),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.favorite, color: Colors.redAccent),
                                Text(
                                  '$favorite',
                                  style: TextStyle(color: Colors.black87),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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
