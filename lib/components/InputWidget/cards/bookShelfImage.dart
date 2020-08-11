import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/handlers/stateHandlers/providers/settings.dart';

class BookShelfImage extends StatefulWidget {
  final PdfPageImage path;

  BookShelfImage({Key key, this.path}) : super(key: key);

  _BookShelfImageState createState() => _BookShelfImageState();
}

class _BookShelfImageState extends State<BookShelfImage>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    SettingsData settingsData = Provider.of<SettingsData>(context);
    return Stack(
      children: <Widget>[RawImage(image: widget.path.imageIfAvailable)],
    );
  }
}
