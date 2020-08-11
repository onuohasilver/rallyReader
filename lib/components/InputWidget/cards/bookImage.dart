import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/handlers/stateHandlers/providers/settings.dart';

import 'bookShelfImage.dart';

class BookImage extends StatefulWidget {
  ///Creates an Image widget with the first page
  ///of the given Pdf file
  const BookImage({
    @required this.path,
    @required this.shadow,
    this.onTap,
  });

  /// path of the pdfPageImage
  final PdfPageImage path;

  /// show a shadow or not.
  final bool shadow;

  /// function to be triggered on the image tap
  final Function onTap;

  @override
  _BookImageState createState() => _BookImageState();
}

class _BookImageState extends State<BookImage> {
  @override
  Widget build(BuildContext context) {
    double heightT = MediaQuery.of(context).size.height;
    double widthT = MediaQuery.of(context).size.width;
    SettingsData settingsData = Provider.of<SettingsData>(context);
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
          height: heightT * .12,
          width: widthT * .22,
          child: Stack(
            children: [
              Container(
                  color: Colors.orange[700],
                  child: BookShelfImage(
                    path: widget.path,
                  )),
              Container(
                color: settingsData.nightMode
                    ? Colors.black.withOpacity(.2)
                    : Colors.transparent,
              ),
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
