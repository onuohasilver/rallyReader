import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MultiColorText extends StatelessWidget {
  const MultiColorText({
    Key key,
    @required this.leading,
    @required this.trailing,
    this.color,
  }) : super(key: key);

  final String leading;
  final String trailing;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:5.0),
      child: Text.rich(TextSpan(
        text: leading,
        style: GoogleFonts.poppins(color: color ?? Colors.red),
        children: [
          TextSpan(
              text: trailing, style: GoogleFonts.poppins(color: Colors.white)),
        ],
      )),
    );
  }
}
