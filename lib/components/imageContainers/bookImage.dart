import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rallyreader/components/imageContainers/bookShelfImage.dart';
import 'package:rallyreader/data/settings.dart';

class BookImage extends StatefulWidget {
  const BookImage(
      {@required this.heightT,
      @required this.widthT,
      @required this.path,
      @required this.shadow,
      this.onTap});

  final double heightT;
  final double widthT;
  final String path;
  final bool shadow;
  final Function onTap;

  @override
  _BookImageState createState() => _BookImageState();
}

class _BookImageState extends State<BookImage> {
  @override
  Widget build(BuildContext context) {
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
          height: widget.heightT * .12,
          width: widget.widthT * .22,
          child: Stack(
            children: [
              Container(
                  color: Colors.orange[700],
                  child: BookShelfImage(
                    path: widget.path,
                  )),
              Container(
                color:settingsData.nightMode?Colors.black.withOpacity(.2):Colors.transparent,
                
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
