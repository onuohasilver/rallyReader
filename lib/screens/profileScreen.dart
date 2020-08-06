import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/buttons/profileMenuCard.dart';
import 'package:rallyreader/components/buttons/topRowButton.dart';
import 'package:rallyreader/components/popups/drawer.dart';
import 'package:rallyreader/components/text/multiColorText.dart';
import 'package:rallyreader/constants.dart';
import 'package:rallyreader/data/data.dart';
import 'package:rallyreader/data/settings.dart';
import 'package:rallyreader/data/userProfileData.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  Firestore firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    UserData userData = Provider.of<UserData>(context);
    SettingsData settingsData = Provider.of<SettingsData>(context);
    return Scaffold(
      drawer: DrawerBuilder(),
      key: scaffoldKey,
      body: Container(
        height: height,
        width: width,
        color: settingsData.bgColor,
        child: FutureBuilder(
            future: firestore
                .collection('users')
                .document(userData.currentUserId)
                .get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              int circlesCount = snapshot.data.data['circles'].length;

              return Column(
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                          height: height * .3,
                          width: width,
                          decoration: kBgImage),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            BackdropFilter(
                              filter:
                                  ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 5.0),
                              child: TopRowButton(
                                scaffoldKey: scaffoldKey,
                                color: Colors.white,
                                notification: IconButton(
                                    icon: Icon(
                                      Icons.notifications,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {}),
                              ),
                            ),
                            SizedBox(height: height * .05),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: height * .15,
                                  width: width * .3,
                                  child: Material(
                                    shape: CircleBorder(),
                                    elevation: 10,
                                    color: Colors.black,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      ' ${userData.userName}',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          shadows: [Shadow(blurRadius: 30)],
                                          fontSize: height * 0.04),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        MultiColorText(
                                          leading: ' 27.5k',
                                          trailing: ' followers',
                                        ),
                                        MultiColorText(
                                          leading: ' $circlesCount',
                                          trailing: ' circles',
                                          color: Colors.green,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: height * .04),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ProfileMenuCard(
                                    label: Icons.supervised_user_circle),
                                ProfileMenuCard(
                                  label: Icons.fiber_smart_record,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ProfileMenuCard(
                                  label: Icons.fiber_smart_record,
                                ),
                                ProfileMenuCard(label: Icons.multiline_chart),
                              ],
                            ),
                            SizedBox(height: height * .01),
                            Text(
                                'The universe is filled with mysteries, and humans are a part of that mystery. - J L Cooper',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: settingsData.blackToWhite))
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
