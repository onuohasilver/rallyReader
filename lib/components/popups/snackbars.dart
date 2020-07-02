import 'package:flutter/material.dart';

showSnackBar(BuildContext context,String text) {
  final snackBar = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.orange,
      duration: Duration(seconds: 1));
  Scaffold.of(context).showSnackBar(snackBar);
}
