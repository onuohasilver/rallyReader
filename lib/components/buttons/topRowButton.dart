import 'package:flutter/material.dart';
class TopRowButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final double height;
  final IconButton notification;
  final Color color;
  const TopRowButton(
      {Key key,
      @required this.scaffoldKey,
      @required this.height,
      this.color,
      this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              notification ??
                  IconButton(
                    icon: Icon(Icons.person, color: color ?? Colors.black,),

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
