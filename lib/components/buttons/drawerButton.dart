import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/data/settings.dart';

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
    SettingsData settingsData = Provider.of<SettingsData>(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: ListTile(
          leading: Icon(
            icon,
            color: color ?? Colors.pink[700],
          ),
          title: Text(
            label,
            style: TextStyle(fontSize: heightT * 0.016,color: settingsData.blackToWhite),
          ),
          enabled: true,
        ),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context,routeName);
        },
      ),
    );
  }
}
