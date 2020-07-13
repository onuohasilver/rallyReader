import 'package:flutter/material.dart';
import 'package:rallyreader/components/buttons/colorFlatButton.dart';
import 'dart:ui' as ui;

import 'package:rallyreader/components/textInput/textEntry.dart';

Future buildSignUpDialog(BuildContext context, double height, double width) {
  return showDialog(
    context: context,
    builder: (context) {
      return BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: height * .6,
            width: width * .8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.orange[100].withOpacity(.2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: height * .1,
                  width: width * .2,
                  child: Image.asset('assets/rallyLogo.png'),
                ),
                TextEntry(width: width, hint: 'your email address'),
                TextEntry(
                    width: width,
                    hint: 'your password',
                    obscure: true,
                    type: TextInputType.text),
                TextEntry(
                    width: width,
                    hint: 'confirm your password',
                    obscure: true,
                    type: TextInputType.text),
                ColorFlatButton(
                  widthT: width,
                  heightT: height * .7,
                  label: 'Create Account',
                  color: Colors.orange[900],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
