import 'package:flutter/material.dart';

class DrawerBuilder extends StatelessWidget {
  final heightT;
  final widthT;

  const DrawerBuilder({
    Key key,
    @required this.heightT,
    @required this.widthT,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 50,
      child: Container(
        height: heightT,
        width: widthT * .7,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: heightT * .08),
            Text.rich(
              TextSpan(
                text: 'Hi!',
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w500,
                    fontSize: heightT * 0.04),
                children: [
                  TextSpan(
                    text: '\nOnuoha Silver',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: heightT * 0.04),
                  ),
                ],
              ),
              textAlign: TextAlign.start,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
              child: Divider(),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.notifications,
                        color: Colors.deepOrange,
                      ),
                      title: Text(
                        'Notification',
                        style: TextStyle(fontSize: heightT * 0.021),
                      ),
                      enabled: true,
                      onTap: () {},
                    ),
                     ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.lime,
                      ),
                      title: Text(
                        'Profile',
                        style: TextStyle(fontSize: heightT * 0.021),
                      ),
                      enabled: true,
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.people,
                        color: Colors.green,
                      ),
                      title: Text(
                        'Friends',
                        style: TextStyle(fontSize: heightT * 0.021),
                      ),
                      enabled: true,
                      onTap: () {},
                    ),
                    Divider(),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.book,
                        color: Colors.blue,
                      ),
                      title: Text(
                        'Books',
                        style: TextStyle(fontSize: heightT * 0.021),
                      ),
                      enabled: true,
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.fiber_smart_record,
                        color: Colors.purple,
                      ),
                      title: Text(
                        'Reading Plans',
                        style: TextStyle(fontSize: heightT * 0.021),
                      ),
                      enabled: true,
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.library_books,
                        color: Colors.indigo,
                      ),
                      title: Text(
                        'Collections',
                        style: TextStyle(fontSize: heightT * 0.021),
                      ),
                      enabled: true,
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      title: Text(
                        'Favorites',
                        style: TextStyle(fontSize: heightT * 0.021),
                      ),
                      enabled: true,
                      onTap: () {},
                    ),
                    Divider(),
                    Divider(),
                     ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.grey,
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(fontSize: heightT * 0.021),
                      ),
                      enabled: true,
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Container(
                        height: heightT * .04,
                        width: widthT * .08,
                        child: Image.asset('assets/rallyLogo.png'),
                      ),
                      title: Text(
                        'About Rally Reader',
                        style: TextStyle(fontSize: heightT * 0.018),
                      ),
                      enabled: true,
                      onTap: () {},
                    ),
                 
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
