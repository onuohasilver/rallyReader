import 'package:flutter/material.dart';

class TopRowButton extends StatelessWidget {
  ///Scaffold key needed to trigger drawer opening
  final GlobalKey<ScaffoldState> scaffoldKey;

  ///IconButton to replace the profile button
  final IconButton notification;

  ///Color of the buttons
  final Color color;

  ///Widget to be used if not IconButtons
  final Widget widget;

  ///creates a stretch containing two icons
  ///usually the drawer trigger button and any other button
  const TopRowButton(
      {Key key,
      @required this.scaffoldKey,
      this.color,
      this.notification,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: height * .09,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: color ?? Colors.black,
                ),
                onPressed: () {
                  scaffoldKey.currentState.openDrawer();
                },
              ),
              //TODO: Show Notifications as a Pop Up
              (notification ?? widget) ??
                  IconButton(
                    icon: Icon(
                      Icons.person,
                      color: color ?? Colors.black,
                    ),
                    splashColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'ProfileScreen',
                      );
                    },
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
