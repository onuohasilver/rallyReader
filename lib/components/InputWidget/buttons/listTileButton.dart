import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/handlers/stateHandlers/providers/settings.dart';

class ListTileButton extends StatelessWidget {
  ///Creates a [ListTile] button with a trailing [IconButton]
  ///widget
  const ListTileButton({
    Key key,
    @required this.label,
    this.activeColor,
    @required this.icon,
    this.condition,
    this.trigger,
  }) : super(key: key);

  /// Label to be displayed on the ListTile button
  final String label;

  /// Icon of the trailing [IconButton] widget

  final IconData icon;

  ///  a state notifying [bool] to determine when the
  /// color of the icon would change
  final bool condition;

  /// the function to be executed on the button tap detected
  final Function trigger;

  /// Color to be displayed when the button is active
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    SettingsData settingsData = Provider.of<SettingsData>(context);

    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Material(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
            leading: Icon(Icons.remove,
                color: settingsData.nightMode ? Colors.white : Colors.black),
            title: Text(label,
                style: GoogleFonts.poppins(
                    color: Colors.white, fontSize: width * .031)),
            trailing: IconButton(
              icon: Icon(icon,
                  color:
                      condition ? activeColor ?? Colors.green : Colors.white),
              onPressed: trigger,
            )),
      ),
    );
  }
}
