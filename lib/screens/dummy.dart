import 'package:flutter/material.dart';

class Dummy extends StatelessWidget {
  final path;
  const Dummy({Key key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RawImage(image: path.imageIfAvailable, fit: BoxFit.contain),
    );
  }
}
