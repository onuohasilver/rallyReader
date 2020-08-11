import 'package:flutter/material.dart';

class TopRowButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  final IconButton notification;
  final Color color;
  final Widget widget;
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
