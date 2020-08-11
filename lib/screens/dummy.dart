import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:pdf_render/pdf_render.dart';

class Dummy extends StatefulWidget {
  final PdfPageImage imageString;
  const Dummy({Key key, @required this.imageString}) : super(key: key);

  @override
  _DummyState createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  bool change = false;

  GlobalKey globalKey = new GlobalKey();
  Future<Uint8List> capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Uint8List pngImage;
    bool caps = false;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          caps
              ? Container(
                  height: 200,
                  child: RepaintBoundary(
                    key: globalKey,
                    child: Image.memory(pngImage),
                  ),
                )
              : CircularProgressIndicator(),
          Container(
            height: 200,
            child: RawImage(
              image: widget.imageString.imageIfAvailable,
            ),
          ),
          RaisedButton(
            onPressed: () async {
              var x = await capturePng();
              setState(
                () {
                  pngImage = x;

                  caps = !caps;
                },
              );
            },
          )
        ],
      ),
    );
  }
}
