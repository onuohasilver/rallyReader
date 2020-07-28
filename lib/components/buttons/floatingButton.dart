import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/popups/modal.dart';
import 'package:rallyreader/data/data.dart';
import 'package:rallyreader/data/settings.dart';

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
    SettingsData settingsData = Provider.of<SettingsData>(context);
    return showFab
        ? FloatingActionButton(
            child: Icon(Icons.add,color:settingsData.whiteToGrey),
            backgroundColor: settingsData.blackToWhite,
            onPressed: () {
              widget.appData.showModal();
              var bottomSheetController = showBottomSheet(
                  context: context,
                  builder: (context) => Modal());
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
