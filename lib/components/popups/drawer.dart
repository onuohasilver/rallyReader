import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/buttons/drawerButton.dart';
import 'package:rallyreader/data/userProfileData.dart';

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
    UserData userData=Provider.of<UserData>(context);
    return Drawer(
      elevation: 50,
      child: Container(
        height: heightT,
        width: widthT * .7,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: heightT * .29,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/topUserImage.png'),
                    fit: BoxFit.cover),
                color: Colors.orangeAccent.withOpacity(.1),
              ),
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text.rich(
                      TextSpan(
                        text: 'Hi!',
                        style: GoogleFonts.poppins(
                            color: Colors.orange[200],
                            fontWeight: FontWeight.w500,
                            shadows: [Shadow(blurRadius: 30)],
                            fontSize: heightT * 0.04),
                        children: [
                          TextSpan(
                            text: '\n${userData.userName}',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                shadows: [Shadow(blurRadius: 30)],
                                fontSize: heightT * 0.04),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    DrawerButton(
                      heightT: heightT,
                      label: 'Notifications',
                      icon: Icons.notifications,
                      color: Colors.orange,
                    ),
                    DrawerButton(
                      heightT: heightT,
                      label: 'Profile',
                      icon: Icons.person,
                      routeName:'ProfileScreen'
                    ),
                    DrawerButton(
                      heightT: heightT,
                      label: 'Book Circle',
                      icon: Icons.supervised_user_circle,
                      color: Colors.green,
                    ),
                    Divider(),
                    DrawerButton(
                      heightT: heightT,
                      label: 'Books',
                      icon: Icons.book,
                      color: Colors.blueAccent,
                    ),
                    DrawerButton(
                      heightT: heightT,
                      label: 'Reading Plans',
                      icon: Icons.fiber_smart_record,
                      color: Colors.purple,
                    ),
                    DrawerButton(
                      heightT: heightT,
                      label: 'Collections',
                      icon: Icons.library_books,
                      routeName: 'CollectionScreen',
                    ),
                    DrawerButton(
                      heightT: heightT,
                      label: 'Favorites',
                      icon: Icons.favorite,
                      color: Colors.red,
                      routeName:'FavoritesScreen'
                    ),
                    Divider(),
                    Divider(),
                    DrawerButton(
                      heightT: heightT,
                      label: 'Settings',
                      icon: Icons.settings,
                      color: Colors.grey,
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
