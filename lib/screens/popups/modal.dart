import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/InputWidget/buttons/colorFlatButton.dart';
import 'package:rallyreader/handlers/dbHandlers/dataSources/circleUpload.dart';
import 'package:rallyreader/handlers/stateHandlers/providers/userProfileData.dart';

class Modal extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    UserData userData = Provider.of<UserData>(context);

    return BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        height: height * .3,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width * .7,
              child: TextField(
                controller: textController,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  hintText: 'Enter new circle name',
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(.5),
                    fontSize: height * .02,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * .01),
            ColorFlatButton(
              ratio: .5,
              label: 'create circle',
              color: Colors.deepOrange,
              onTap: () {
                updateCircle(userData, textController.text);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
