import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/buttons/listTileButton.dart';
import 'package:rallyreader/components/buttons/longColorButton.dart';
import 'package:rallyreader/components/buttons/topRowButton.dart';
import 'package:rallyreader/components/popups/drawer.dart';
import 'package:rallyreader/components/text/pageTitles.dart';
import 'package:rallyreader/data/data.dart';
import 'package:rallyreader/data/settings.dart';
import 'package:rallyreader/data/userProfileData.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Data appData = Provider.of<Data>(context);
    UserData userData = Provider.of<UserData>(context);
    SettingsData settingsData = Provider.of<SettingsData>(context);

    return Scaffold(
      drawer: DrawerBuilder(widthT: width, heightT: height),
      key: scaffoldKey,
      body: Container(
        height: height,
        width: width,
        color: Colors.orangeAccent[100].withOpacity(.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: height * .05),
              BackButton(onPressed: () {
                Navigator.pop(context);
              }),
              PageTitle(heightT: height, title: 'Settings'),
              SizedBox(height: height * .01),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Material(
                      elevation: 14,
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.brown[800],
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: height * .03, vertical: height * .03),
                        child: ListTile(
                            leading: Icon(Icons.person, color: Colors.white),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("${userData.userName}",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: height * .03)),
                                Text("My Profile",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white54)),
                              ],
                            ),
                            trailing: IconButton(
                              icon:
                                  Icon(Icons.arrow_right, color: Colors.white),
                              onPressed: () =>
                                  Navigator.pushNamed(context, 'ProfileScreen'),
                            )),
                      ),
                    ),
                    SizedBox(height: height * .012),
                    PageTitle(heightT: height * .7, title: 'Account'),
                    SizedBox(height: height * .012),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        LongColorButton(
                          height: height,
                          width: width,
                          color: Colors.blue[800],
                          icon: Icons.text_format,
                          label: 'Change UserName',
                        ),
                        LongColorButton(
                          height: height,
                          width: width,
                          color: Colors.orange[800],
                          icon: Icons.vpn_key,
                          label: 'Change Password',
                        ),
                        LongColorButton(
                          height: height,
                          width: width,
                        ),
                        LongColorButton(
                          height: height,
                          width: width,
                          color: Colors.red[800],
                          icon: Icons.exit_to_app,
                          label: 'Sign Out',
                        ),
                      ],
                    ),
                    SizedBox(height: height * .012),
                    PageTitle(heightT: height * .7, title: 'App Settings'),
                    SizedBox(height: height * .012),
                    ListTileButton(
                        label: "Night Mode",
                        icon: Icons.wb_sunny,
                        width: width,
                        condition: settingsData.nightMode,
                        trigger: () => settingsData.setNightMode()),
                    SizedBox(height: height * .012),
                    PageTitle(heightT: height * .7, title: 'Reader Settings'),
                    SizedBox(height: height * .012),
                    ListTileButton(
                        label: "Allow Page Swipe",
                        width: width,
                        icon: Icons.check_circle,
                        condition: settingsData.enableSwipe,
                        trigger: () => settingsData.enableSwiping()),
                    ListTileButton(
                      label: "Swipe Horizontal",
                      width: width,
                      icon: Icons.check_circle,
                      condition: settingsData.swipeHorizontal,
                      trigger: () => settingsData.setSwipeDirection(),
                    ),
                    ListTileButton(
                      label: "Allow Page Snap",
                      width: width,
                      icon: Icons.check_circle,
                      condition: settingsData.pageSnap,
                      trigger: () => settingsData.setPageSnap(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

