import 'package:flutter/material.dart';

class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({
    Key key,
    @required this.height,
    @required this.width,
    this.label,
  }) : super(key: key);

  final double height;
  final double width;
  final IconData label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * .21,
        width: width * .4,
        child: Stack(
          children: [
            Material(
              
              elevation: 30,
              borderRadius: BorderRadius.circular(15),
              color: Colors.brown.withOpacity(.6),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: Center(child: Icon(label, size: height * .1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
