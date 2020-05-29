import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  const BookImage(
      {Key key,
      @required this.heightT,
      @required this.widthT,
      @required this.image})
      : super(key: key);

  final double heightT;
  final double widthT;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black54, blurRadius: 30, spreadRadius: 3),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: heightT * .2,
          width: widthT * .3,
          child: Material(
            child: Ink.image(
              image: AssetImage(image),
              fit: BoxFit.fill,
              child: InkWell(
                onTap: () {},
                splashColor: Colors.orangeAccent.withOpacity(.3),
              ),
            ),
            elevation: 4,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
