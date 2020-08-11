import 'package:flutter/material.dart';

class ColorFlatButton extends StatelessWidget {
  ///Creates a material colored button that can be fine-tuned
  ///receives an [onTap] function and screen-height-width[ratio]
  const ColorFlatButton(
      {Key key, this.label, this.onTap, this.color, this.ratio})
      : super(key: key);

  ///[String] text to be displayed on the button
  ///defaults to
  ///```
  ///Text('No Label', style: TextStyle(fontSize: 15, color: Colors.white),)
  ///```
  final String label;

  ///the function to be executed on button tap response detected
  final Function onTap;

  /// the color of the button widget
  /// defaults to [Colors.purple]
  final Color color;

  /// the [MediaQuery] multiplier ratio to either reduce or increase
  /// maxes out at 1.0
  final double ratio;

  @override
  Widget build(BuildContext context) {
    double heightT = MediaQuery.of(context).size.height;
    double widthT = MediaQuery.of(context).size.width;
    return Container(
      width: widthT * .4,
      height: heightT * .1 * (ratio ?? 1),
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
