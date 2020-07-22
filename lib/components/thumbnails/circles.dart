import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Circle extends StatelessWidget {
  const Circle(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.color,
      @required this.animation,
      @required this.label,
      @required this.count})
      : super(key: key);

  final double height;
  final double width;
  final Color color;
  final Animation animation;
  final String label;
  final int count;
  @override
  Widget build(BuildContext context) {
    double sizer = .65;
    if (count < 5) {
      sizer = .65;
    } else if (count > 5 && count < 20) {
      sizer = 1.0;
    } else if (count > 20) {
      sizer = 1.5;
    }

    return ScaleTransition(
      scale: animation,
      child: Material(
        elevation: 40,
        type: MaterialType.circle,
        color: color ?? Colors.green,
        child: Container(
          height: height * .12 * sizer,
          width: width * .25 * sizer,
          child: InkWell(
            customBorder: CircleBorder(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    label,
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: width * .03),
                  ),
                  Text(
                    count.toString(),
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: width * .02),
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
