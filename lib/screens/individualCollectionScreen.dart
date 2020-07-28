import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/buttons/topRowButton.dart';
import 'package:rallyreader/components/popups/drawer.dart';
import 'package:rallyreader/components/text/pageTitles.dart';
import 'package:rallyreader/data/data.dart';
import 'package:rallyreader/data/settings.dart';

class IndividualCollectionScreen extends StatefulWidget {
  @override
  _IndividualCollectionScreenState createState() =>
      _IndividualCollectionScreenState();
}

class _IndividualCollectionScreenState
    extends State<IndividualCollectionScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Data appData = Provider.of<Data>(context);
    SettingsData settingsData = Provider.of<SettingsData>(context);
    final String bookTitles = ModalRoute.of(context).settings.arguments;
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
              PageTitle(heightT: height, title: bookTitles,color:settingsData.blackToWhite),
              Expanded(
                child: ListView.builder(
                  itemCount: appData.caches[bookTitles].length,
                  itemBuilder: (context,index){
                    return Text(appData.caches[bookTitles][index]);
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
