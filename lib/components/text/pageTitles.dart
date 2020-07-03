import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key key,
    @required this.heightT,
    @required this.title
  }) : super(key: key);

  final double heightT;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
          fontSize: heightT * .034, fontWeight: FontWeight.w600),
    );
  }
}
