import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/handlers/stateHandlers/providers/settings.dart';


class BookShelfImage extends StatefulWidget {
  final String path;

  BookShelfImage({Key key, this.path}) : super(key: key);

  _BookShelfImageState createState() => _BookShelfImageState();
}

class _BookShelfImageState extends State<BookShelfImage>
    with WidgetsBindingObserver {
       final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  
  int currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
     SettingsData settingsData = Provider.of<SettingsData>(context);
    return Stack(
      children: <Widget>[
        PDFView(
          filePath: widget.path,
          enableSwipe: false,
          swipeHorizontal: true,
          autoSpacing: false,
          pageFling: false,
          pageSnap: false,
          defaultPage: currentPage,
          fitPolicy: FitPolicy.BOTH,
          preventLinkNavigation:
              false, // if set to true the link is handled in flutter
          onRender: (_pages) {
            setState(() {
              isReady = true;
            });
          },
          onError: (error) {
            setState(() {
              errorMessage = error.toString();
            });
            print(error.toString());
          },
         onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
         
         
        
        ),
        errorMessage.isEmpty
            ? !isReady
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container()
            : Center(
                child: Text(errorMessage),
              )
      ],
    );
  }
}
