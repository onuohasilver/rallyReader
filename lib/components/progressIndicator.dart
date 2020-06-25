import 'package:flutter/material.dart';

class CurvedLinearProgressIndicator extends StatelessWidget {
  const CurvedLinearProgressIndicator({
    Key key,
    @required this.widthT,
    this.heightT,
    @required this.value, @required this.read, this.readColor,
  }) : super(key: key);

  final double widthT;
  final double heightT;
  final double value;
  final bool read;
  final Color readColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: widthT * .3,
            height: 8,
            child: LinearProgressIndicator(
              value: value,
              valueColor: AlwaysStoppedAnimation(read?Colors.orange:readColor),
              backgroundColor: Colors.grey[300],
            ),
          ),
        ),
        read?Text(
          '  ${value * 100}%',
          style: TextStyle(
            color: Colors.grey[400],
          )
        ):Container(),
      ],
    );
  }
}
