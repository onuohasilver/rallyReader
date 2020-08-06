import 'package:flutter/material.dart';
import 'package:rallyreader/components/buttons/colorFlatButton.dart';
import 'dart:ui' as ui;

import 'package:rallyreader/components/textInput/textEntry.dart';
import 'package:rallyreader/handlers/signInHandlers/emailSignInHandler.dart';

Future buildShowDialog(BuildContext context, double height, double width) {
  return showDialog(
    context: context,
    builder: (context) {
      TextEditingController password = TextEditingController();
      TextEditingController email = TextEditingController();
      return BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: height * .5,
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
                TextEntry(
                  width: width,
                  hint: 'your email address',
                  controller: email,
                ),
                TextEntry(
                  width: width,
                  hint: 'your password',
                  obscure: true,
                  type: TextInputType.text,
                  controller: password,
                ),
                ColorFlatButton(
                  ratio: .7,
                  label: 'Log In',
                  color: Colors.orange[900],
                  onTap: () {
                    signInWithEmail(email.text, password.text)
                        .whenComplete((() {
                      Navigator.pushReplacementNamed(context, 'SetProfile');
                    }));
                  },
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
