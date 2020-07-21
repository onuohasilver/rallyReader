import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Circle extends StatelessWidget {
  const Circle({
    Key key,
    @required this.height,
    @required this.width,
    @required this.color,
    @required this.animation,
    @required this.label,
  }) : super(key: key);

  final double height;
  final double width;
  final Color color;
  final Animation animation;
  final String label;
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: Material(
        elevation: 40,
        type: MaterialType.circle,
        color: color ?? Colors.green,
        child: Container(
          height: height * .12,
          width: width * .25,
          child: InkWell(
            customBorder: CircleBorder(),
            child: Center(
              child: Text(
                label,
                style: GoogleFonts.poppins(
                    color: Colors.white, fontSize: width * .03),
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
