import 'package:flutter/material.dart';
import 'dart:ui' as ui;

final BoxDecoration kBgImage = BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/topUserImage.png'), fit: BoxFit.cover),
    color: Colors.orangeAccent.withOpacity(.1));

final BoxDecoration kSignInImage = BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/signBg.jpg'), fit: BoxFit.cover),
    color: Colors.orangeAccent.withOpacity(.1));

final BackdropFilter blurObject = BackdropFilter(
  filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
  child: Text('sss'),
);
