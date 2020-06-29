import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/bookShelfImage.dart';
import 'package:rallyreader/data/data.dart';
import 'package:rallyreader/handlers/handlers.dart';
import 'package:rallyreader/screens/landingScreen.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  GetPermission getPermission = GetPermission();
  List<String> fileNames;
  var bs64;
  GlobalKey key;
  GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    getPermission.requestPermission;
    fileNames = getPermission.getFileList;
    super.initState();
  }

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      bs64 = base64Encode(pngBytes);
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
    double heightT = MediaQuery.of(context).size.height;
    double widthT = MediaQuery.of(context).size.width;
    final appData = Provider.of<Data>(context);

    // appData.updateFiles(fileNames);

    return RepaintBoundary(
      key: GlobalKey(),
      child: Scaffold(
        body: Container(
          height: heightT,
          width: widthT,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100),
                RaisedButton(
                  onPressed: () {
                    _capturePng();
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LandingScreen(
                            base64String: bs64,
                          );
                        },
                      ),
                    );
                  },
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        PdfController pdfController = PdfController(
                            document: PdfDocument.openFile(fileNames[index]),
                            viewportFraction: 1.0);
                        GlobalKey globalKey = GlobalKey();

                        return RepaintBoundary(
                          key:_globalKey,
                          child: BookShelfImage(
                            key: globalKey,
                            pdfController: pdfController,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
