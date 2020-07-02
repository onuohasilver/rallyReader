import 'package:flutter/material.dart';

class TopRowButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const TopRowButton(
    {Key key,
    this.scaffoldKey,}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          
          onPressed: () {
            scaffoldKey.currentState.openDrawer();
          },
        ),
        //TODO: Show Notifications as a Pop Up
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {},
        ),
      ],
    );
  }
}
