import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      backgroundColor: Colors.orange[50].withOpacity(.4),
      elevation: 0,
      selectedItemColor: Colors.deepOrange,
      currentIndex:1,
      items: [
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
