import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/data/settings.dart';

class ReadScreen extends StatefulWidget {
  final String path;

  ReadScreen({Key key, this.path}) : super(key: key);

  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int pages = 0;
  int currentPage = 0;
  bool isReady = false;
  bool showOptions = false;
  Timer timer;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SettingsData settingsData = Provider.of<SettingsData>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: height * .8,
              child: PDFView(
                filePath: widget.path,
                enableSwipe: settingsData.enableSwipe,
                swipeHorizontal: settingsData.swipeHorizontal,
                autoSpacing: true,
                pageFling: true,
                pageSnap: settingsData.pageSnap,
                defaultPage: currentPage,
                fitPolicy: FitPolicy.WIDTH,
                nightMode: settingsData.nightMode,
                fitEachPage: true,
                preventLinkNavigation:
                    false, // if set to true the link is handled in flutter
                onRender: (_pages) {
                  setState(() {
                    pages = _pages;
                    isReady = true;
                  });
                },
                onError: (error) {
                  setState(() {
                    errorMessage = error.toString();
                  });
                  print(error.toString());
                },
                onPageError: (page, error) {
                  setState(() {
                    errorMessage = '$page: ${error.toString()}';
                  });
                  print('$page: ${error.toString()}');
                },
                onViewCreated: (PDFViewController pdfViewController) {
                  _controller.complete(pdfViewController);
                },
                onLinkHandler: (String uri) {
                  print('goto uri: $uri');
                },
                onPageChanged: (int page, int total) {
                  print('page change: $page/$total');
                  setState(() {
                    currentPage = page;
                  });
                },
              ),
            ),
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : Center(
                  child: Text(errorMessage),
                ),
                 Positioned.fill(top:height*.1,
            child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("$currentPage / $pages")
                )),
          ),
          Positioned.fill(  
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.bookmark,
                        color: showOptions ? Colors.orange : Colors.grey),
                    onPressed: () {
                      setState(
                        () {
                          showOptions = !showOptions;
                        },
                      );
                    },
                  ),
                )),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.remove_red_eye,
                        color: showOptions ? Colors.orange : Colors.grey),
                    onPressed: () {
                      setState(
                        () {
                          showOptions = !showOptions;
                        },
                      );
                    },
                  ),
                )),
          ),
          showOptions
              ? Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FutureBuilder<PDFViewController>(
                      future: _controller.future,
                      builder:
                          (context, AsyncSnapshot<PDFViewController> snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: height * .06,
                              child: Stack(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    PageNavButton(
                                      currentPage: currentPage,
                                      snapshot: snapshot,
                                      icon: Icons.arrow_left,
                                      onTap: () async {
                                        setState(() {
                                          currentPage--;
                                        });
                                        await snapshot.data
                                            .setPage(currentPage);
                                      },
                                      onTapDown: (TapDownDetails details) {
                                        timer = Timer.periodic(
                                            Duration(milliseconds: 500), (t) {
                                          setState(() {
                                            currentPage--;
                                          });
                                        });
                                      },
                                      onTapUp: (TapUpDetails details) async {
                                        timer.cancel();

                                        await snapshot.data
                                            .setPage(currentPage);
                                      },
                                      onTapCancel: () {
                                        print('cancel');
                                        timer.cancel();
                                      },
                                    ),
                                    Text('   $currentPage of $pages  ',
                                        style: GoogleFonts.poppins()),
                                    PageNavButton(
                                      currentPage: currentPage,
                                      snapshot: snapshot,
                                      onTap: () async {
                                        setState(() {
                                          currentPage++;
                                        });
                                        await snapshot.data
                                            .setPage(currentPage);
                                      },
                                      onTapDown: (TapDownDetails details) {
                                        timer = Timer.periodic(
                                            Duration(milliseconds: 500), (t) {
                                          setState(() {
                                            currentPage++;
                                          });
                                        });
                                      },
                                      onTapUp: (TapUpDetails details) async {
                                        timer.cancel();

                                        await snapshot.data
                                            .setPage(currentPage);
                                      },
                                      onTapCancel: () {
                                        print('cancel');
                                        timer.cancel();
                                      },
                                    ),
                                  ],
                                ),
                              ]),
                            ),
                          );
                        }

                        return Container();
                      },
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class PageNavButton extends StatelessWidget {
  const PageNavButton(
      {Key key,
      @required this.currentPage,
      @required this.snapshot,
      this.icon,
      this.onTapDown,
      this.onTapUp,
      this.onTapCancel,
      this.onTap})
      : super(key: key);

  final int currentPage;
  final AsyncSnapshot snapshot;
  final IconData icon;
  final Function onTapDown;
  final Function onTapUp;
  final Function onTapCancel;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onTap: onTap,
      child: Material(
        type: MaterialType.circle,
        color: Colors.deepOrange[800],
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              icon ?? Icons.arrow_right,
              size: 30,
              color: Colors.white,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
