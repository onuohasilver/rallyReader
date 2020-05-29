import 'package:flutter/material.dart';

class ColorFlatButton extends StatelessWidget {
  const ColorFlatButton({
    Key key,
    @required this.widthT,
    @required this.heightT,
    this.label, this.onTap,
  }) : super(key: key);

  final double widthT;
  final double heightT;
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthT * .4,
      height: heightT * .1,
      child: Material(
        color: Color(0xFF574497),
        child: InkWell(
          onTap:onTap,
          child: Center(
            child: Text(
              label,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),

        ),
      ),
    );
  }
}
