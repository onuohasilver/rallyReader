import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/buttons/topRowButton.dart';
import 'package:rallyreader/components/popups/drawer.dart';
import 'package:rallyreader/components/text/pageTitles.dart';
import 'package:rallyreader/components/thumbnails/collectionThumbnail.dart';
import 'package:rallyreader/data/data.dart';

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
    Data appData = Provider.of<Data>(context);
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
                child: GridView.builder(
                  //TODO: Use animatedGridViewBuilder
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: appData.caches.length,
                  itemBuilder: (context, index) {
                    Map source = appData.caches;
                    List titles = [];
                    List<int> contents = [];
                    for (String collection in source.keys) {
                      titles.add(collection);
                    }
                    for (List counter in source.values) {
                      contents.add(counter.length);
                    }
                    return CollectionThumbNail(
                      title: titles[index],
                      height: height,
                      width: width,
                      numberOfBooks: contents[index],
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          'IndividualCollectionScreen',
                          arguments: titles[index],
                        );
                      },
                      onLongPress: (){
                        ///TODO: Add long press popup that has 
                        /// TODshare option and  delete option
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
