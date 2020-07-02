import 'package:flutter/material.dart';

showSnackBar(GlobalKey<ScaffoldState> key, String text) {
  final snackBar = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.orange,
      duration: Duration(seconds: 1));
  key.currentState.showSnackBar(snackBar);
}
