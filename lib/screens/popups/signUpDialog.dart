import 'package:flutter/material.dart';
import 'package:rallyreader/components/InputWidget/buttons/colorFlatButton.dart';
import 'package:rallyreader/components/InputWidget/textInput/textEntry.dart';
import 'dart:ui' as ui;
import 'package:rallyreader/handlers/signInHandlers/emailSignInHandler.dart';

Future buildSignUpDialog(BuildContext context, double height, double width) {
  return showDialog(
    context: context,
    builder: (context) {
      TextEditingController password = TextEditingController();
      TextEditingController passwordConfirm = TextEditingController();
      TextEditingController email = TextEditingController();
      return BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
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
                TextEntry(
                  width: width,
                  hint: 'email address',
                  controller: email,
                ),
                TextEntry(
                  width: width,
                  hint: 'password',
                  obscure: true,
                  type: TextInputType.text,
                  controller: password,
                ),
                TextEntry(
                  width: width,
                  hint: 'confirm  password',
                  obscure: true,
                  type: TextInputType.text,
                  controller: passwordConfirm,
                ),
                ColorFlatButton(
                  ratio: .7,
                  label: 'Create Account',
                  color: Colors.orange[900],
                  onTap: () {
                    assert(password.text == passwordConfirm.text);
                    signUpWithEmail(email.text, password.text)
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
