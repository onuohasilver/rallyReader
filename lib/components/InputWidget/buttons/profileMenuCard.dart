import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/handlers/stateHandlers/providers/settings.dart';

class ProfileMenuCard extends StatelessWidget {
  ///creates a large container with a centered icon
  ///[IconData] is provided as the [label] argument

  const ProfileMenuCard({
    Key key,
    this.label,
  }) : super(key: key);

  /// [IconData]
  final IconData label;

  @override
  Widget build(BuildContext context) {
    SettingsData settingsData = Provider.of<SettingsData>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * .21,
        width: width * .4,
        child: Stack(
          children: [
            Material(
              elevation: 30,
              borderRadius: BorderRadius.circular(15),
              color: settingsData.opacityBrownToGrey,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: Center(
                    child: Icon(label,
                        size: height * .1, color: settingsData.blackToWhite)),
              ),
            ),
            Positioned.fill(
              bottom: height * .02,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('Following',
                      style: GoogleFonts.poppins(
                          color: settingsData.blackToWhite))),
            )
          ],
        ),
      ),
    );
  }
}
