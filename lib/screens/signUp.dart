import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/banners.dart';
import 'package:rallyreader/components/buttons/signUpButton.dart';
import 'package:rallyreader/components/popups/loginDialog.dart';
import 'package:rallyreader/components/popups/signUpDialog.dart';
import 'package:rallyreader/constants.dart';
import 'dart:ui' as ui;

import 'package:rallyreader/data/data.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {
  AnimationController animationController;
  AnimationController boxAnimationController;
  Animation animation;
  Animation boxAnimation;
  Animation delayedBoxAnimation;
  Animation delayedAnimation;
  Animation secondDelayedAnimation;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    boxAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.bounceInOut, parent: animationController));
    boxAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.bounceInOut, parent: boxAnimationController));
    delayedBoxAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(.5, 1.0, curve: Curves.bounceInOut),
        parent: boxAnimationController));
    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(.5, 1.0, curve: Curves.bounceInOut),
        parent: animationController));
    secondDelayedAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            curve: Interval(.7, 1.0, curve: Curves.bounceInOut),
            parent: animationController));
    super.initState();
  }
  @override
  void dispose(){
    animationController.dispose();
    boxAnimationController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    animationController.repeat(reverse: true);
    boxAnimationController.forward();

    Data appData = Provider.of<Data>(context);
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: appData.progressComplete,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, widget) {
            return Container(
              height: height,
              width: width,
              decoration: kSignInImage,
              child: Padding(
                padding: EdgeInsets.only(top: height * .07),
                child: Stack(children: <Widget>[
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SignBox(
                              height: height * 1.5,
                              animation: animation,
                              width: width,
                              text: 'R\nE\nAD',
                              textRatio: .07,
                            ),
                            GrowingCicle(
                              height: height,
                              width: width,
                              animation: animation,
                            ),
                            SignBox(
                              height: height * 2,
                              animation: delayedAnimation,
                              width: width * .9,
                              text: 'SHARE',
                              bgColor: Colors.orange[900],
                              textRatio: .09,
                            ),
                            GrowingCicle(
                              height: height * 1.3,
                              width: width * 1.5,
                              animation: secondDelayedAnimation,
                            ),
                            SignBox(
                              height: height * 2.5,
                              animation: secondDelayedAnimation,
                              width: width * .9,
                              text: 'ENGAGE',
                              textRatio: .1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SignUpButton(
                          boxAnimation: boxAnimation,
                          width: width,
                          height: height,
                          color: Colors.orange[900],
                          text: 'Sign up With Google',
                        ),
                        SignUpButton(
                          boxAnimation: delayedBoxAnimation,
                          width: width,
                          height: height,
                          text: 'Sign up With Email',
                          onTap: () {
                            buildSignUpDialog(context, height, width);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 48.0),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Already have an Account?',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500),
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: () {
                                  buildShowDialog(context, height, width);
                                },
                                splashColor: Colors.orange[900],
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    ' Login Here',
                                    style: GoogleFonts.poppins(
                                        color: Colors.orange[900],
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * .05,
                        )
                      ],
                    ),
                  ))
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
