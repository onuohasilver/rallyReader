import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/buttons/fancyFAB.dart';
import 'package:rallyreader/components/buttons/topRowButton.dart';
import 'package:rallyreader/components/imageContainers/userCircleCards.dart';
import 'package:rallyreader/components/popups/drawer.dart';
import 'package:rallyreader/components/popups/messageBoard.dart';
import 'package:rallyreader/components/popups/snackbars.dart';
import 'package:rallyreader/components/text/pageTitles.dart';
import 'package:rallyreader/components/thumbnails/thumbnail.dart';
import 'package:rallyreader/data/data.dart';
import 'package:rallyreader/data/settings.dart';
import 'package:rallyreader/data/userProfileData.dart';
import 'package:rallyreader/handlers/dbHandlers/firestoreFutures.dart';
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
      drawer: DrawerBuilder(),
      key: scaffoldKey,
      body: StreamBuilder(
        stream: firestore
            .collection('namedCollections')
            .document(title)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List members = [];
          List messageBoard;
          Map circle = snapshot.data.data;
          members = circle['members'];

          messageBoard = circle['messageBoard'];

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
                        scaffoldKey: scaffoldKey,
                        widget: StreamBuilder(
                            stream: firestore
                                .collection('users')
                                .document(userData.currentUserId)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Container();
                              }
                              List previousCircles = snapshot.data['circles'];
                              String buttonLabel =
                                  previousCircles.contains(title)
                                      ? "Leave"
                                      : "Join";
                              return Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: settingsData.blackToWhite,
                                  borderRadius: BorderRadius.circular(5),
                                  onTap: () async {
                                    List circles = [];
                                    circles.addAll(previousCircles);
                                    if (!circles.contains(title)) {
                                      circles.add(title);
                                      members.add({
                                        'name': userData.userName,
                                        'userID': userData.currentUserId
                                      });

                                      firestore
                                          .collection('namedCollections')
                                          .document(title)
                                          .setData({'members': members},
                                              merge: true);
                                      showSnackBar(
                                          scaffoldKey, 'You joined the Circle',
                                          color: Colors.green);
                                    } else {
                                      circles.remove(title);
                                      members.removeWhere((element) =>
                                          element['userID'] ==
                                          userData.currentUserId);
                                      firestore
                                          .collection('namedCollections')
                                          .document(title)
                                          .setData({'members': members},
                                              merge: true);

                                      showSnackBar(
                                          scaffoldKey, 'You left the Circle',
                                          color: Colors.red);
                                    }

                                    firestore
                                        .collection('users')
                                        .document(userData.currentUserId)
                                        .setData({'circles': circles},
                                            merge: true);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      buttonLabel,
                                      style: GoogleFonts.poppins(
                                          fontSize: height * .024,
                                          fontWeight: FontWeight.w500,
                                          color: settingsData.blackToWhite),
                                    ),
                                  ),
                                ),
                              );
                            }),
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
                                name: members[index]['name'],
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
                child:
                    FancyFab(onPressed: () {}, icon: Icons.add, circle: title),
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
