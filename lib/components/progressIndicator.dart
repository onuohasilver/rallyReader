import 'package:flutter/material.dart';

class CurvedLinearProgressIndicator extends StatelessWidget {
  const CurvedLinearProgressIndicator({
    Key key,
    @required this.widthT, this.heightT,
  }) : super(key: key);

  final double widthT;
  final double heightT;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
                child: Container(
        width: widthT * .3,
        height: 8,
        child: LinearProgressIndicator(
          value: .53,
          valueColor: AlwaysStoppedAnimation(Colors.orange),
          backgroundColor: Colors.grey[300],
        ),
      ),
    );
  }
}
