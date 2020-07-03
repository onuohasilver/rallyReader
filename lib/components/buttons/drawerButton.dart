import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    Key key,
    @required this.heightT,
    @required this.label,
    @required this.icon,
    this.routeName,
    this.color,
  }) : super(key: key);

  final double heightT;
  final String label;
  final IconData icon;
  final String routeName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: ListTile(
          leading: Icon(
            icon,
            color: color ?? Colors.black,
          ),
          title: Text(
            label,
            style: TextStyle(fontSize: heightT * 0.021),
          ),
          enabled: true,
        ),
        onTap: () {
          Navigator.pushNamed(context,routeName);
        },
      ),
    );
  }
}
