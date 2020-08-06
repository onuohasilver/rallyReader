import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rallyreader/screens/genericUserScreen.dart';

class UserCircleCard extends StatelessWidget {
  const UserCircleCard({
    Key key,
    @required this.height,
    @required this.width,
    @required this.name,
  }) : super(key: key);

  final double height;
  final double width;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: height * .1,
        width: width * .2,
        child: Material(
          elevation: 7,
          type: MaterialType.circle,
          color: Colors.brown[900],
          child: InkWell(
            customBorder: CircleBorder(),
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => GenericUserScreen(
                            name: name,
                            userID: 'dmuuWzEV5RR3j9hvv6wjk8Tm36d2',
                          )));
            },
            child: Center(child: Text(name)),
          ),
        ),
      ),
    );
  }
}
