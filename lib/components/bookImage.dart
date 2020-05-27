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
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        height: heightT * .2,
        width: widthT * .3,
        child: Material(
          child: Ink.image(
            image: AssetImage(image),
            fit: BoxFit.fill,
            child: InkWell(onTap: (){},splashColor: Colors.orangeAccent.withOpacity(.3),
          ),),
          elevation: 2,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
