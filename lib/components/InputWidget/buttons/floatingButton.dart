import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rallyreader/handlers/stateHandlers/providers/data.dart';
import 'package:rallyreader/handlers/stateHandlers/providers/settings.dart';
import 'package:rallyreader/screens/popups/modal.dart';

class MyFloatingActionButton extends StatefulWidget {
  /// Appwide ProviderData
  final Data appData;

  ///Creates a normal Floating ActionButton which has an extended
  ///functionality of disappearing
  ///when the showFab condition is not met

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
            child: Icon(Icons.add, color: settingsData.whiteToGrey),
            backgroundColor: settingsData.blackToWhite,
            onPressed: () {
              widget.appData.showModal();
              var bottomSheetController = showBottomSheet(
                  context: context, builder: (context) => Modal());
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
