import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignBox extends StatelessWidget {
  const SignBox({
    Key key,
    @required this.height,
    @required this.animation,
    @required this.width,
    @required this.text,
    this.bgColor,
    this.textColor,@required this.textRatio,
  }) : super(key: key);

  final double height;
  final Animation animation;
  final String text;
  final double width;
  final Color bgColor;
  final Color textColor;
  final double textRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .2 * animation.value,
      width: width * .23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor ?? Colors.black,
      ),
      child: Padding(
        padding: EdgeInsets.all(width*.06),
        child: Center(
          child: Text(text,
              style: GoogleFonts.poppins(
                  color: textColor ?? Colors.white,
                  fontSize: width * textRatio,
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}




class GrowingCicle extends StatelessWidget {
  const GrowingCicle({
    Key key,
    @required this.height,
    @required this.width,
    @required this.animation,
  }) : super(key: key);

  final double height;
  final double width;
  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * .1,
        width: width * .07 * animation.value,
        child: Material(type: MaterialType.circle, color: Colors.black));
  }
}

