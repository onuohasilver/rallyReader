import 'package:flutter/material.dart';
import 'package:rallyreader/components/buttons/topRowButton.dart';
import 'package:rallyreader/components/popups/drawer.dart';
import 'package:rallyreader/components/text/pageTitles.dart';
import 'package:rallyreader/components/thumbnails/thumbnail.dart';
import 'package:rallyreader/data/data.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/collections/books.dart';
import 'package:rallyreader/handlers/handlers.dart';
import 'package:rallyreader/screens/viewScreen.dart';

class LandingScreen extends StatefulWidget {
  final base64String;

  const LandingScreen({Key key, this.base64String}) : super(key: key);
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String selectedCollection = 'Scaly';
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<Data>(context);

    double heightT = MediaQuery.of(context).size.height;
    double widthT = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.orangeAccent.withOpacity(.8),
      drawer: DrawerBuilder(widthT: widthT, heightT: heightT),
      key: scaffoldKey,
      body: Container(
        height: heightT,
        width: widthT,
        color: Colors.white.withOpacity(.78),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TopRowButton(
                scaffoldKey: scaffoldKey,
                height: heightT,
              ),
              PageTitle(
                heightT: heightT,
                title: 'Recent Books.',
              ),
              Container(
                height: heightT * .12,
                width: widthT,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  itemCount: appData.filePath.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return ThumbNail(
                      pdfController: null,
                      heightT: heightT,
                      widthT: widthT,
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: bookList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var book = bookList[index];

                    return ExpandedThumbnail(
                      heightT: heightT,
                      widthT: widthT,
                      title: appData.filePath[index].split('/').last,
                      pdfController: null,
                      key: null,
                      scaffoldKey: scaffoldKey,
                      completion: book.completion,
                      showMenu: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return BookScreen(
                                title: book.title,
                                image: book.image,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
