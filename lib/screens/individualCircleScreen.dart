import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/buttons/fancyFAB.dart';
import 'package:rallyreader/components/buttons/topRowButton.dart';
import 'package:rallyreader/components/popups/drawer.dart';
import 'package:rallyreader/components/popups/messageBoard.dart';
import 'package:rallyreader/components/popups/snackbars.dart';
import 'package:rallyreader/components/text/pageTitles.dart';
import 'package:rallyreader/components/thumbnails/thumbnail.dart';
import 'package:rallyreader/data/data.dart';
import 'package:rallyreader/data/settings.dart';
import 'package:rallyreader/data/userProfileData.dart';
import 'package:rallyreader/screens/viewScreen.dart';

class IndividualCircleScreen extends StatefulWidget {
  @override
  _IndividualCircleScreenState createState() => _IndividualCircleScreenState();
}

class _IndividualCircleScreenState extends State<IndividualCircleScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Firestore firestore = Firestore.instance;
    SettingsData settingsData = Provider.of<SettingsData>(context);
    UserData userData = Provider.of<UserData>(context);
    final String title = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      drawer: DrawerBuilder(widthT: width, heightT: height),
      key: scaffoldKey,
      body: StreamBuilder(
        stream: firestore
            .collection('namedCollections')
            .document('namedCircles')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List members;
          List messageBoard;
          for (var circle in snapshot.data.data['circles']) {
            circle['name'] == title ? members = circle['members'] : Container();
            circle['name'] == title
                ? messageBoard = circle['messageBoard']
                : Container();
          }
          return Stack(children: [
            Container(
              height: height,
              width: width,
              color: settingsData.bgColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TopRowButton(
                        height: height,
                        scaffoldKey: scaffoldKey,
                        widget: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: settingsData.blackToWhite,
                            borderRadius: BorderRadius.circular(5),
                            onTap: () async {
                              List previousCircles = await firestore
                                  .collection('users')
                                  .document(userData.currentUserId)
                                  .get()
                                  .then(
                                    (value) => value['circles'],
                                  );
                              List circles = [];
                              circles.addAll(previousCircles);
                              circles.add(title);
                              firestore
                                  .collection('users')
                                  .document(userData.currentUserId)
                                  .setData({'circles': circles}, merge: true);
                               showSnackBar(scaffoldKey, 'Joined Successfully!');
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Join',
                                style: GoogleFonts.poppins(
                                    fontSize: height * .024,
                                    fontWeight: FontWeight.w500,
                                    color: settingsData.blackToWhite),
                              ),
                            ),
                          ),
                        ),
                        color: settingsData.blackToWhite),
                    PageTitle(
                        heightT: height,
                        title: title,
                        color: settingsData.blackToWhite),
                    Expanded(
                      child: Container(
                        height: height * .1,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: members.length,
                            itemBuilder: (context, index) {
                              return UserCircleCard(
                                height: height,
                                width: width,
                                name: members[index],
                              );
                            }),
                      ),
                    ),
                    PageTitle(
                        heightT: height * .7,
                        title: 'Shared Books',
                        color: settingsData.blackToWhite),
                    Container(
                      height: height * .5,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.brown[100],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
            Positioned.fill(
              bottom: height * .15,
              right: width * .07,
              child: Align(
                alignment: Alignment.bottomRight,
                child: FancyFab(
                  onPressed: () {},
                  icon: Icons.add,
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: MessageBoard(
                      width: width, height: height, messages: messageBoard),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}

class UserCircleCard extends StatelessWidget {
  const UserCircleCard({
    Key key,
    @required this.height,
    @required this.width,
    @required this.name,
  }) : super(key: key);

  final double height;
  final double width;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: height * .1,
        width: width * .2,
        child: Material(
          elevation: 7,
          type: MaterialType.circle,
          color: Colors.brown[900],
          child: InkWell(
            customBorder: CircleBorder(),
            onTap: () {},
            child: Center(child: Text(name)),
          ),
        ),
      ),
    );
  }
}
