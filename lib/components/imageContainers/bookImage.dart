import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:rallyreader/components/imageContainers/bookShelfImage.dart';
import 'package:rallyreader/screens/readScreen.dart';

class BookImage extends StatefulWidget {
  const BookImage(
      {@required this.heightT,
      @required this.widthT,
      @required this.path,
      @required this.shadow,
      @required this.key,
      this.onTap})
      : super(key: key);

  final double heightT;
  final double widthT;
  final String path;
  final bool shadow;
  final Function onTap;
  final GlobalKey key;

  @override
  _BookImageState createState() => _BookImageState();
}

class _BookImageState extends State<BookImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: widget.shadow
            ? [
                BoxShadow(
                    color: Colors.black54, blurRadius: 10, spreadRadius: 3),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: widget.heightT * .12,
          width: widget.widthT * .22,
          child: Stack(
            children: [
         
              Container(
                  color: Colors.pinkAccent,
                  child: BookShelfImage(
                    path: widget.path,
                  )),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onTap,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
