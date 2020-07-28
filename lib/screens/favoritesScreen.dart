import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/buttons/topRowButton.dart';
import 'package:rallyreader/components/popups/drawer.dart';
import 'package:rallyreader/components/text/pageTitles.dart';
import 'package:rallyreader/components/thumbnails/thumbnail.dart';
import 'package:rallyreader/data/data.dart';
import 'package:rallyreader/data/settings.dart';
import 'package:rallyreader/screens/viewScreen.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Data appData = Provider.of<Data>(context);
    SettingsData settingsData = Provider.of<SettingsData>(context);

    return Scaffold(
      drawer: DrawerBuilder(widthT: width, heightT: height),
      key: scaffoldKey,
      body: Container(
        height: height,
        width: width,
        color: settingsData.bgColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TopRowButton(height: height, scaffoldKey: scaffoldKey,color:settingsData.blackToWhite),
              PageTitle(heightT: height, title: 'Favorite Books',color:settingsData.blackToWhite),
              Expanded(
                child: ListView.builder(
                  itemCount: appData.favorites.length,
                  itemBuilder: (BuildContext context, int index) {
                    var book = appData.favorites[index];

                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        child: ExpandedThumbnail(
                          heightT: height,
                          widthT: width,
                          title: book,
                         path:appData.filePath[index],
                          key: null,
                          scaffoldKey: scaffoldKey,
                          completion: 23.0,
                          showMenu: false,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return BookScreen(
                                    title: book,
                                    image: null,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        onLongPress: (){
                          //TODO: Add deleting to long press pop UP
                          print('Long Press');
                        },
                      ),
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
