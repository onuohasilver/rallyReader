import 'package:flutter/material.dart';
import 'package:rallyreader/components/buttons/topRowButton.dart';
import 'package:rallyreader/components/popups/drawer.dart';
import 'package:rallyreader/components/text/pageTitles.dart';
import 'package:rallyreader/components/thumbnails/thumbnail.dart';
import 'package:rallyreader/data/data.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/data/settings.dart';
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<Data>(context);
    SettingsData settingsData = Provider.of<SettingsData>(context);
    double heightT = MediaQuery.of(context).size.height;
    double widthT = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: DrawerBuilder(widthT: widthT, heightT: heightT),
      key: scaffoldKey,
      body: Container(
        height: heightT,
        width: widthT,
        color: settingsData.bgColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TopRowButton(
                scaffoldKey: scaffoldKey,
                height: heightT,
                color:settingsData.blackToWhite
              ),
              PageTitle(
                  heightT: heightT,
                  title: 'Recent Books.',
                  color: settingsData.blackToWhite),
              Container(
                height: heightT * .12,
                width: widthT,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  cacheExtent: 10.0,
                  itemCount: appData.filePath.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return ThumbNail(
                      path: appData.filePath[index],
                      heightT: heightT,
                      widthT: widthT,
                    );
                  },
                ),
              ),
              PageTitle(
                  heightT: heightT * .7,
                  title: 'My  Books.',
                  color: settingsData.blackToWhite),
              Expanded(
                flex: 2,
                child: Container(
                  child: ListView.builder(
                    itemCount: appData.filePath.length,
                    itemBuilder: (BuildContext context, int index) {
                      String title = appData.filePath[index].split('/').last;
                      return ExpandedThumbnail(
                        heightT: heightT,
                        widthT: widthT,
                        title: title,
                        path: appData.filePath[index],
                        key: null,
                        scaffoldKey: scaffoldKey,
                        completion: 20.0,
                        showMenu: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return BookScreen(
                                    title: title,
                                    image: 'book.image',
                                    path: appData.filePath[index]);
                              },
                            ),
                          ).then((value) => setState(() => {}));
                        },
                      );
                    },
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
