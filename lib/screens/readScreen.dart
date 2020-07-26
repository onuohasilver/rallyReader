import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:flutter_pdfview/flutter_pdfview.dart';

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
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: height * .8,
              child: PDFView(
                filePath: widget.path,
                enableSwipe: true,
                swipeHorizontal: true,
                autoSpacing: true,
                pageFling: true,
                pageSnap: true,
                defaultPage: currentPage,
                fitPolicy: FitPolicy.WIDTH,
                nightMode: false,
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
                                Center(
                                  child: Container(
                                    width: width * .3,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    PageNavButton(
                                        currentPage: currentPage,
                                        snapshot: snapshot,
                                        icon: Icons.arrow_left),
                                    GestureDetector(
                                      child: Text('   $currentPage of $pages  ',
                                          style: GoogleFonts.poppins()),
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return StatefulBuilder(
                                                builder: (context, setState) {
                                             

                                              return Dialog(
                                                child: Container(
                                                    color: Colors.white,
                                                    height: height * .13,
                                                    width: width * .3,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text('Goto',
                                                              style: GoogleFonts
                                                                  .poppins()),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            IconButton(
                                                                icon: Icon(Icons
                                                                    .remove),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    currentPage =
                                                                        currentPage -
                                                                            1;
                                                                  });
                                                                }),
                                                            RaisedButton(
                                                              child: Text(
                                                                  '$currentPage'),
                                                              onPressed:
                                                                  () async {
                                                                Navigator.pop(
                                                                    context);
                                                                await snapshot
                                                                    .data
                                                                    .setPage(
                                                                        currentPage);
                                                              },
                                                            ),
                                                            IconButton(
                                                                icon: Icon(Icons
                                                                    .add),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    currentPage =
                                                                        currentPage +
                                                                            1;
                                                                  });
                                                                }),
                                                          ],
                                                        )
                                                      ],
                                                    )),
                                              );
                                            });
                                          },
                                        );
                                      },
                                    ),
                                    PageNavButton(
                                        currentPage: currentPage,
                                        snapshot: snapshot),
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
      {Key key, @required this.currentPage, @required this.snapshot, this.icon})
      : super(key: key);

  final int currentPage;
  final AsyncSnapshot snapshot;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.circle,
      color: Colors.deepOrange[800],
      child: IconButton(
        icon: Icon(
          icon ?? Icons.arrow_right,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () async {
          await snapshot.data.setPage(currentPage + 1);
        },
      ),
    );
  }
}
