import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';


class BookImage extends StatelessWidget {
  const BookImage(
      {
      @required this.heightT,
      @required this.widthT,
      @required this.pdfController,
      @required this.shadow,
      @required this.key,
      this.onTap})
      : super(key: key);

  final double heightT;
  final double widthT;
  final PdfController pdfController;
  final bool shadow;
  final Function onTap;
  final GlobalKey key;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: shadow
            ? [
                BoxShadow(
                    color: Colors.black54, blurRadius: 10, spreadRadius: 3),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: heightT * .12,
          width: widthT * .22,
          child: Stack(
            children: [
              // BookShelfImage(pdfController: pdfController, key: key),
              Container(
                color: Colors.pinkAccent
              ),
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
