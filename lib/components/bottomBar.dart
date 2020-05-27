import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
        icon: Icon(MaterialCommunityIcons.book_open_variant),
        title: Text(''),
      ),
      BottomNavigationBarItem(
        icon: Icon(MaterialCommunityIcons.notebook_multiple),
        title: Text(''),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        title: Text(''),
      )
    ]);
  }
}
