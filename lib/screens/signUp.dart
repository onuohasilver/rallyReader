import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rallyreader/components/banners.dart';
import 'package:rallyreader/constants.dart';
import 'dart:ui' as ui;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  Animation delayedAnimation;
  Animation secondDelayedAnimation;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.bounceInOut, parent: animationController));
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
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    animationController.repeat(reverse: true);
    return Scaffold(
      body: AnimatedBuilder(
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
                            height: height*1.5,
                            animation: animation,
                            width: width,
                            text: 'R\nE\nAD', textRatio: .07,),
                        GrowingCicle(
                          height: height,
                          width: width,
                          animation: animation,
                        ),
                        SignBox(
                          height: height*2,
                          animation: delayedAnimation,
                          width: width*.9,
                          text: 'SHARE',
                          bgColor: Colors.deepOrange, textRatio: .09,
                        ),
                        GrowingCicle(
                          height: height*1.3,
                          width: width*1.5,
                          animation: secondDelayedAnimation,
                        ),
                        SignBox(
                            height: height * 2.5,
                            animation: secondDelayedAnimation,
                            width: width * .9,
                            text: 'ENGAGE', textRatio: .1,),
                      ],
                    ),
                  ),
                  ),
                ),
              ]),
            ),
          );
        },
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

