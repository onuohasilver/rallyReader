import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:google_fonts/google_fonts.dart';
import 'package:rallyreader/components/buttons/topRowButton.dart';
import 'package:rallyreader/components/popups/drawer.dart';
import 'package:rallyreader/components/text/pageTitles.dart';
import 'package:rallyreader/components/thumbnails/collectionThumbnail.dart';

class Collections extends StatefulWidget {
  @override
  _CollectionsState createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
              TopRowButton(scaffoldKey: scaffoldKey, height: height),
              PageTitle(heightT: height, title: 'Collections'),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  padding: EdgeInsets.all(5),
                  crossAxisCount: 2,
                  children: <Widget>[
                    CollectionThumbNail(
                      height: height,
                      width: width,
                      numberOfBooks: 34,
                      title: 'Study',
                    ),
                    CollectionThumbNail(
                      height: height,
                      width: width,
                      numberOfBooks: 10,
                      title: 'Leisure',
                    ),
                    Container(
                      height: height * .2,
                      width: width / 4,
                      child: ConstrainedBox(
                        constraints: ,
                        child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            shadowColor: Colors.grey[100],
                            child: InkWell(
                                child: Icon(Icons.add, size: height * .3),
                                onTap: () {})),
                      ),
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
