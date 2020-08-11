import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LongColorButton extends StatelessWidget {
  const LongColorButton({
    Key key,
  
    this.icon,
    this.color,
    this.label,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: height * .2,
        width: width * .2,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(10),
          color: color ?? Colors.green[700],
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon ?? Icons.email, color: Colors.white),
                Text(label ?? 'Change Email',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: width * .03))
              ],
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}