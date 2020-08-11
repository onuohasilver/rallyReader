import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:pdf_render/pdf_render.dart';

class BookShelfImage extends StatefulWidget {
  final PdfPageImage path;

  BookShelfImage({Key key, this.path}) : super(key: key);
  _BookShelfImageState createState() => _BookShelfImageState();
}

class _BookShelfImageState extends State<BookShelfImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.deepOrange[700],
          child: RawImage(image: widget.path.imageIfAvailable),
        ),
      ],
    );
  }
}
