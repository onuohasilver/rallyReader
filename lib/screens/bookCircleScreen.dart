import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rallyreader/components/InputWidget/buttons/floatingButton.dart';
import 'package:rallyreader/components/InputWidget/buttons/topRowButton.dart';

import 'package:rallyreader/components/text/pageTitles.dart';

import 'package:rallyreader/components/widgetContainers/thumbnails/circles.dart';
import 'package:rallyreader/handlers/dbHandlers/dataSources/circleUpload.dart';
import 'package:rallyreader/handlers/stateHandlers/providers/data.dart';
import 'package:rallyreader/handlers/stateHandlers/providers/settings.dart';
import 'package:rallyreader/handlers/stateHandlers/providers/userProfileData.dart';
import 'package:rallyreader/screens/popups/drawer.dart';

class BookCircleScreen extends StatefulWidget {
  @override
  _BookCircleScreenState createState() => _BookCircleScreenState();
}

class _BookCircleScreenState extends State<BookCircleScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Data appData = Provider.of<Data>(context);
    UserData userData = Provider.of<UserData>(context);
    SettingsData settingsData = Provider.of<SettingsData>(context);
    bool showingModal = appData.showingModal;
    Future<QuerySnapshot> namedCircles =
        firestore.collection('namedCollections').getDocuments();

    Future<dynamic> previousCircles =
        firestore.collection('users').document(userData.currentUserId).get();
    animationController.forward();
    return Scaffold(
      drawer: DrawerBuilder(),
      key: scaffoldKey,
      floatingActionButton: MyFloatingActionButton(
        appData: appData,
      ),
      body: GestureDetector(
        onTap: () {
          if (showingModal) {
            appData.showModal();
            Navigator.of(context).pop();
          }
        },
        child: Container(
          height: height,
          width: width,
          color: settingsData.bgColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TopRowButton(
                  scaffoldKey: scaffoldKey,
                  color: settingsData.blackToWhite,
                ),
                PageTitle(
                  heightT: height * .7,
                  title: 'My Circles',
                  color: settingsData.blackToWhite,
                ),
                Expanded(
                  child: GlowingOverscrollIndicator(
                    axisDirection: AxisDirection.down,
                    color: Colors.deepOrange,
                    child: FutureBuilder(
                      future: Future.wait([namedCircles, previousCircles]),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List circles = [];
                          snapshot.data[0].documents
                              .forEach((value) => circles.add(value.data));

                          List previousUserCircles =
                              snapshot.data[1].data['circles'];

                          Map<String, List<Widget>> circleWidgets = {};
                          Map<String, List<Widget>> usersCircles = {};

                          ///thresh for the number of rows to be created
                          int thresh = ((circles.length / 3).round() +
                              ((circles.length % 3) != 0 ? 1 : 0));
                          int userThresh = ((previousUserCircles.length / 3)
                                  .round() +
                              ((previousUserCircles.length % 3) != 0 ? 1 : 0));

                          ///indexCounter that increments to indicate that
                          ///the current row of Widgets has been satisfied
                          int indexCounter = 0;
                          int indexCounterIndiv = 0;

                          ///loop through the number of specified row thresh
                          for (int rowIndex = 0;
                              rowIndex < (thresh);
                              rowIndex++) {
                            ///create a key,value pair to match current loop index
                            circleWidgets['row $rowIndex'] = [];
                            usersCircles['row $rowIndex'] = [];
                            for (int index = indexCounter;
                                index < circles.length;
                                index++) {
                              ///add widgets to the current loop until it is satisfied
                              if (circleWidgets['row $rowIndex'].length < 3) {
                                circleWidgets['row $rowIndex'].add(
                                  Circle(
                                      animation: animation,
                                      label: circles[indexCounter]['name'],
                                      count: circles[indexCounter]['members']
                                          .length,
                                      width: width,
                                      height: height,
                                      color: Colors.blue[800]),
                                );

                                //  previousCircles.contains(circles[indexCounter]['name'] )?usersCircles['row $rowIndex'].add('');
                                indexCounter++;
                                //  print('contained');
                              }
                            }
                            for (int index = indexCounterIndiv;
                                index < circles.length;
                                index++) {
                              if ((usersCircles['row $rowIndex'].length < 3)) {
                                print('IndexCount $indexCounterIndiv');
                                print(circles[indexCounterIndiv]['name']);
                                previousUserCircles.contains(
                                        circles[indexCounterIndiv]['name'])
                                    ? usersCircles['row $rowIndex'].add(
                                        Circle(
                                            animation: animation,
                                            label: circles[indexCounterIndiv]
                                                ['name'],
                                            count: circles[indexCounterIndiv]
                                                    ['members']
                                                .length,
                                            width: width,
                                            height: height,
                                            color: Colors.brown[800]),
                                      )
                                    : print('dumb');

                                indexCounterIndiv++;
                              }
                            }
                          }
                          print(usersCircles);

                          List<Widget> userDisplayCircles = [];
                          for (int index = 0; index < userThresh; index++) {
                            userDisplayCircles.add(
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: usersCircles['row $index'],
                                ),
                              ),
                            );
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: settingsData.opacityBlackToWhite,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListView(
                                    physics: BouncingScrollPhysics(),
                                    children: userDisplayCircles,
                                  ),
                                ),
                              ),
                              PageTitle(
                                heightT: height * .7,
                                title: 'All Circles',
                                color: settingsData.blackToWhite,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: settingsData.opacityBlackToWhite,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListView.builder(
                                    itemCount: thresh,
                                    // itemExtent: 10,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: circleWidgets['row $index'],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.deepOrange),
                                strokeWidth: 5),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
