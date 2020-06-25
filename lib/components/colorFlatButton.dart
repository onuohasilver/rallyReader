import 'package:flutter/material.dart';

class ColorFlatButton extends StatelessWidget {
  const ColorFlatButton({
    Key key,
    @required this.widthT,
    @required this.heightT,
    this.label, this.onTap, this.color,
  }) : super(key: key);

  final double widthT;
  final double heightT;
  final String label;
  final Function onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthT * .4,
      height: heightT * .1,
    
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color:color?? Color(0xFF574497),
        child: InkWell(
           borderRadius: BorderRadius.circular(10),
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
