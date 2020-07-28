import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/data/settings.dart';

class ProfileMenuCard extends StatelessWidget {
///creates a large container with a centered icon
///[IconData] is provided as the [label] argument

  const ProfileMenuCard({
    Key key,
    @required this.height,
    @required this.width,
    this.label,
  }) : super(key: key);
///MediaQuery height data
  final double height;
  ///MediaQuery width data
  final double width;
  /// [IconData]
  final IconData label;

  @override
  Widget build(BuildContext context) {
    SettingsData settingsData = Provider.of<SettingsData>(context);
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
                child: Center(child: Icon(label, size: height * .1,color:settingsData.blackToWhite)),
              ),
            ),
            Positioned.fill(
              bottom:height*.02,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('Following',style: GoogleFonts.poppins(color:settingsData.blackToWhite))
              ),
            )
          ],
        ),
      ),
    );
  }
}
