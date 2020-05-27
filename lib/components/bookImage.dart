import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    Key key,
    @required this.heightT,
    @required this.widthT,
    @required this.color,
  }) : super(key: key);

  final double heightT;
  final double widthT;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightT * .2,
      width: widthT * .3,
      child: Material(
        elevation: 2,
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
