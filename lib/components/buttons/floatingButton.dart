import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:rallyreader/data/data.dart';

class MyFloatingActionButton extends StatefulWidget {
  final Data appData;

  const MyFloatingActionButton({Key key, this.appData}) : super(key: key);
  @override
  _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  bool showFab = true;
  @override
  Widget build(BuildContext context) {
    return showFab
        ? FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.deepOrange,
            onPressed: () {
              widget.appData.showModal();
              var bottomSheetController = showBottomSheet(
                  context: context,
                  builder: (context) => BackdropFilter(
                        filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          color: Colors.grey[900],
                          height: 250,
                        ),
                      ));
              showFoatingActionButton(false);

              bottomSheetController.closed.then((value) {
                showFoatingActionButton(true);
              });
            },
          )
        : Container();
  }

  void showFoatingActionButton(bool value) {
    setState(() {
      showFab = value;
    });
  }
}
