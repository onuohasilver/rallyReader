import 'package:flutter/material.dart';

showSnackBar(GlobalKey<ScaffoldState> key, String text,{Color color}) {
  final snackBar = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      backgroundColor:color?? Colors.orange,
      duration: Duration(seconds: 1));
  key.currentState.showSnackBar(snackBar);
}
