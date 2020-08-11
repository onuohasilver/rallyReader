import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/handlers/stateHandlers/providers/settings.dart';

class DrawerButton extends StatelessWidget {
  ///Creates a button similar to a [ListTile]
  ///with a [label] and a leading [icon]
  ///simply for navigating to specified [routeName]
  const DrawerButton({
    Key key,
    @required this.label,
    @required this.icon,
    this.routeName,
    this.color,
  }) : super(key: key);

  ///[String] text to be displayed on the button
  final String label;

  /// the leading icon of the button <displayed before the label>
  final IconData icon;

  /// the route to be navigated to as prespecified on the main script route generator
  final String routeName;

  /// the color of the icon widget
  final Color color;

  @override
  Widget build(BuildContext context) {
    SettingsData settingsData = Provider.of<SettingsData>(context);
    double width = MediaQuery.of(context).size.width;
    double heightT = MediaQuery.of(context).size.height;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: settingsData.blackToWhite,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: width * .03, horizontal: width * .03),
          child: Row(children: [
            Icon(
              icon,
              color: color ?? Colors.pink[700],
            ),
            SizedBox(width: width * .14),
            Text(
              label,
              style: GoogleFonts.poppins(
                  fontSize: heightT * 0.016, color: settingsData.blackToWhite),
            ),
          ]),
        ),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}
