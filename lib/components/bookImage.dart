import 'package:flutter/material.dart';
import 'package:rallyreader/screens/addScreen.dart';
import 'package:rallyreader/screens/viewScreen.dart';

class BookImage extends StatelessWidget {
  const BookImage(
      {Key key,
      @required this.heightT,
      @required this.widthT,
      this.image,
      @required this.shadow,
      this.onTap})
      : super(key: key);

  final double heightT;
  final double widthT;
  final String image;
  final bool shadow;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: shadow
            ? [
                BoxShadow(
                    color: Colors.black54, blurRadius: 10, spreadRadius: 3),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: heightT * .2,
          width: widthT * .3,
          child: Stack(
            children: [
              BookShelfScreen(),
              Material(
                color:Colors.transparent,
                child: InkWell(
                  onTap:onTap,
                  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
