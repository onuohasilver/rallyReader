import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:rallyreader/handlers/signInHandlers/googleSignInHandler.dart';
import 'package:rallyreader/handlers/stateHandlers/providers/data.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key key,
    @required this.boxAnimation,
  
    @required this.text,
  
    
    this.color,
    this.onTap,
  }) : super(key: key);

  final Animation boxAnimation;

  final String text;
  final Color color;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    Data appData = Provider.of<Data>(context);
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
              onTap: onTap ??
                  () {
                    appData.progress();
                    signInWithGoogle().whenComplete(
                      (() {
                         appData.progress();
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.pushReplacementNamed(context, 'SetProfile');
                        });

                       
                      }),
                    );
                  },
            ),
          ),
        ),
      ),
    );
  }
}
