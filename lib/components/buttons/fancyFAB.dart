import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FancyFab({this.onPressed, this.tooltip, this.icon});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.brown[900],
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget add() {
    return Container(
        child: Material(
      type: MaterialType.circle,
      color: Colors.brown[900],
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        paddingA(),
                        paddingA(),
                        paddingA(),
                        paddingA(),
                        paddingA(),
                        paddingA(),
                        paddingA(),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Padding(
            padding:EdgeInsets.all(10),
            child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        )),
      ),
    ));
  }

  Padding paddingA() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        color: Colors.purple,
      ),
    );
  }

  Widget image() {
    return Container(
      child: Material(
        type: MaterialType.circle,
        color: Colors.brown[900],
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Icon(Icons.image,size:30,color:Colors.white),
          ),
        ),
      ),
    );
  }

  Widget inbox() {
    return Container(
      child: Material(
        type: MaterialType.circle,
        color: Colors.brown[900],
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Icon(Icons.inbox,size:30,color: Colors.white,),
          ),
        ),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: add(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: image(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: inbox(),
        ),
        toggle(),
      ],
    );
  }
}
