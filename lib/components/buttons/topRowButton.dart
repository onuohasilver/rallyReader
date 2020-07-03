import 'package:flutter/material.dart';

class TopRowButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final double height;
  const TopRowButton({
    Key key,
    @required this.scaffoldKey,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: height * .09,
        ),
        Row(
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
        ),
      ],
    );
  }
}
