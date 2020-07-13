import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        curve: Interval(.5,1.0,curve:Curves.bounceInOut), parent: animationController));
    secondDelayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(.7,1.0,curve:Curves.bounceInOut), parent: animationController));
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
            color: Colors.orange[100],
            child: Padding(
              padding: EdgeInsets.only(top: height * .07),
              child: Stack(children: <Widget>[
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Image.asset('assets/readingWoman.png',
                          fit: BoxFit.contain),
                      height: height * .3,
                      width: width * .5,
                    ),
                  ),
                ),
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: height * .2 * animation.value,
                        width: width * .23,
                        color: Colors.black,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('READ',
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: width * .12,fontWeight:FontWeight.w600)),
                        ),
                      ),
                      Container(
                          height: height * .1,
                          width: width * .07 * animation.value,
                          child: Material(
                            type: MaterialType.circle,
                            color:Colors.black
                          )),
                      Container(
                        height: height * .3 * delayedAnimation.value,
                        width: width * .3,
                        color: Colors.deepOrange,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text('SHARE',
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: width * .11,fontWeight:FontWeight.w600)),
                          ),
                        ),
                      ),
                      Container(
                          height: height * .1,
                          width: width * .09 * delayedAnimation.value,
                          child: Material(
                            type: MaterialType.circle,
                            color:Colors.black
                          )),
                      Container(
                        height: height * .3 * animation.value,
                        width: width * .23,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('ENGAGE',
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: width * .09,fontWeight:FontWeight.w600)),
                        ),
                      ),
                    ],
                  ),
                )),
              ]),
            ),
          );
        },
      ),
    );
  }
}
