import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';
import 'package:rallyreader/components/buttons/floatingButton.dart';
import 'package:rallyreader/components/buttons/topRowButton.dart';
import 'package:rallyreader/components/popups/drawer.dart';
import 'package:rallyreader/components/text/pageTitles.dart';
import 'package:rallyreader/components/thumbnails/circles.dart';

import 'package:rallyreader/data/data.dart';
import 'package:rallyreader/handlers/dbHandlers/firestoreFutures.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Data appData = Provider.of<Data>(context);
    bool showingModal = appData.showingModal;
    animationController.forward();
    return Scaffold(
      drawer: DrawerBuilder(widthT: width, heightT: height),
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
          color: Colors.orangeAccent[100].withOpacity(.3),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TopRowButton(height: height, scaffoldKey: scaffoldKey),
                PageTitle(heightT: height, title: 'My Circles'),
                Expanded(
                  child: GlowingOverscrollIndicator(
                    axisDirection: AxisDirection.down,
                    color: Colors.deepOrange,
                    child: FutureBuilder(
                      future: firestore
                          .collection('namedCollections')
                          .document(
                            'namedCircles',
                          )
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List circles = snapshot.data.data['circles'];
                          Map circleWidgets = {};
                          int thresh = ((circles.length / 3).round() +
                              ((circles.length % 3) != 0 ? 1 : 0));
                          int indexCounter = 0;

                          for (int rowIndex = 0;
                              rowIndex < (thresh);
                              rowIndex++) {
                            circleWidgets['row $rowIndex'] = [];
                            for (int index = indexCounter;
                                index < circles.length;
                                index++) {
                                  if(circleWidgets['row $rowIndex'].length<3){
                                    circleWidgets['row $rowIndex'].add(Text(circles[index]['name']));
                                    indexCounter++;
                                  }
                                }
                          }

                          print(circles.length);
                          print(thresh);

                          print(circleWidgets);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // children: circleWidgets['row 1']
                          );
                        } else {
                          return CircularProgressIndicator();
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

//  Spacer(),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Circle(
//                         height: height,
//                         width: width,
//                         color: Colors.green,
//                         animation: animation,
//                         label: 'Top Niggas',
//                       ),
//                       Circle(
//                         height: height * .5,
//                         width: width * .5,
//                         color: Colors.purple,
//                         animation: animation,
//                         label: 'Rolling Men',
//                       ),
//                       Circle(
//                         height: height * 1.5,
//                         width: width * 1.5,
//                         color: Colors.red,
//                         animation: animation,
//                         label: 'Religion',
//                       )
//                     ],
//                   ),
//                   Spacer(),
//                   PageTitle(
//                     heightT: height,
//                     title: 'All Circles',
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Circle(
//                         height: height * 1.5,
//                         width: width * 1.5,
//                         color: Colors.blue[900],
//                         animation: animation,
//                         label: 'Deeep Fried',
//                       ),
//                       Circle(
//                         height: height,
//                         width: width,
//                         color: Colors.green,
//                         animation: animation,
//                         label: 'Top Niggas',
//                       ),
//                       Circle(
//                         height: height * .5,
//                         width: width * .5,
//                         color: Colors.purple,
//                         animation: animation,
//                         label: 'Rolling Men',
//                       ),
//                     ],
//                   ),
