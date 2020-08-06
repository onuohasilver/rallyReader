import 'package:flutter/material.dart';

class ColorFlatButton extends StatelessWidget {
  const ColorFlatButton({
    Key key,
    this.label,
    this.onTap,
    this.color,
    this.ratio
  }) : super(key: key);

  final String label;
  final Function onTap;
  final Color color;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    double heightT = MediaQuery.of(context).size.height;
    double widthT = MediaQuery.of(context).size.width;
    return Container(
      width: widthT * .4,
      height: heightT * .1*(ratio??1),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: color ?? Color(0xFF574497),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Center(
            child: Text(
              label ?? 'No Label',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
