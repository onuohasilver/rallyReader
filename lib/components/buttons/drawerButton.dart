import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/data/settings.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    Key key,
    @required this.heightT,
    @required this.label,
    @required this.icon,
    this.routeName,
    this.color,
  }) : super(key: key);

  final double heightT;
  final String label;
  final IconData icon;
  final String routeName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    SettingsData settingsData = Provider.of<SettingsData>(context);
    double width=MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: settingsData.blackToWhite,
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical:width*.03,horizontal: width*.03),
          child: Row(children: [
            Icon(
              icon,
              color: color ?? Colors.pink[700],
            ),
            SizedBox(width:width*.05),
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
