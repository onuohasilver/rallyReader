import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rallyreader/handlers/signInHandlers/googleSignInHandler.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key key,
    @required this.boxAnimation,
    @required this.width,
    @required this.text,
    @required this.height,
    this.color,
    this.onTap,
  }) : super(key: key);

  final Animation boxAnimation;
  final double width;
  final double height;
  final String text;
  final Color color;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(boxAnimation.value * width, 0, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height * .05,
          width: width * .6,
          child: Material(
            borderRadius: BorderRadius.circular(30),
            color: color ?? Colors.grey,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              child: Center(
                child: Text(
                  text,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
              onTap:onTap ?? () {
                
                    signInWithGoogle().whenComplete(
                      (() => print('Sign In Succesful!')),
                    );
              },
            ),
          ),
        ),
      ),
    );
  }
}
