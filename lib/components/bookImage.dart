import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:rallyreader/screens/addScreen.dart';

class BookImage extends StatelessWidget {
  const BookImage(
      {Key key,
      @required this.heightT,
      @required this.widthT,
      @required this.pdfController,
      @required this.shadow,
      @required this.keyString,
      this.onTap})
      : super(key: key);

  final double heightT;
  final double widthT;
  final PdfController pdfController;
  final bool shadow;
  final Function onTap;
  final String keyString;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: shadow
            ? [
                BoxShadow(
                    color: Colors.black54, blurRadius: 10, spreadRadius: 3),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: heightT * .2,
          width: widthT * .3,
          child: Stack(
            children: [
              BookShelfScreen(pdfController: pdfController, key: Key('$key')),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
