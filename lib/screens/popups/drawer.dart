import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/InputWidget/buttons/drawerButton.dart';
import 'package:rallyreader/handlers/stateHandlers/providers/settings.dart';
import 'package:rallyreader/handlers/stateHandlers/providers/userProfileData.dart';


class DrawerBuilder extends StatelessWidget {
  const DrawerBuilder({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context);
    SettingsData settingsData = Provider.of<SettingsData>(context);
    double heightT = MediaQuery.of(context).size.height;
    double widthT = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widthT * .7,
      child: Drawer(
        elevation: 50,
        child: Container(
          height: heightT,
          width: widthT * .1,
          color: settingsData.whiteToBlack,
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
                      padding: EdgeInsets.symmetric(horizontal: widthT * .03),
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
                padding: EdgeInsets.symmetric(
                    horizontal: widthT * .03, vertical: 4.0),
                child: Divider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthT * .009),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      DrawerButton(
                        label: 'Notifications',
                        icon: Icons.notifications,
                        color: Colors.orange,
                      ),
                      DrawerButton(
                          label: 'Profile',
                          icon: Icons.person,
                          routeName: 'ProfileScreen'),
                      DrawerButton(
                        label: 'Book Circle',
                        icon: Icons.supervised_user_circle,
                        color: Colors.green,
                        routeName: 'BookCircleScreen',
                      ),
                      Divider(),
                      DrawerButton(
                        label: 'Books',
                        icon: Icons.book,
                        color: Colors.blueAccent,
                      ),
                      DrawerButton(
                        label: 'Reading Plans',
                        icon: Icons.fiber_smart_record,
                        color: Colors.purple,
                      ),
                      DrawerButton(
                        label: 'Collections',
                        icon: Icons.library_books,
                        routeName: 'CollectionScreen',
                      ),
                      DrawerButton(
                          label: 'FavorXites',
                          icon: Icons.favorite,
                          color: Colors.red,
                          routeName: 'FavoritesScreen'),
                      Divider(),
                      Divider(),
                      DrawerButton(
                        label: 'Settings',
                        icon: Icons.settings,
                        color: Colors.grey,
                        routeName: 'Settings',
                      ),
                      ListTile(
                        leading: Container(
                          height: heightT * .04,
                          width: widthT * .08,
                          child: Image.asset('assets/rallyLogo.png'),
                        ),
                        title: Text(
                          'About Rally Reader',
                          style: TextStyle(
                              fontSize: heightT * 0.018,
                              color: settingsData.blackToWhite),
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
      ),
    );
  }
}
