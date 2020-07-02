import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rallyreader/data/data.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/thumbnail.dart';
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
  GetPermission getPermission = GetPermission();
  List<String> fileNames;
  String selectedCollection = 'Scaly';
  @override
  void initState() {
    getPermission.requestPermission;
    fileNames = getPermission.getFileList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<Data>(context);
    appData.updateFiles(fileNames);
    double heightT = MediaQuery.of(context).size.height;
    double widthT = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: Colors.orangeAccent.withOpacity(.8),
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
              SizedBox(
                height: heightT * .09,
              ),
              Text(
                'Recent Books.',
                style: GoogleFonts.poppins(
                    fontSize: heightT * .034, fontWeight: FontWeight.w600),
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
                    GlobalKey key = GlobalKey();
                    return ThumbNail(
                      pdfController: null,
                      key: key,
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
                      completion: book.completion,
                      
                      
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BookScreen(
                            title: book.title,
                            image: book.image,
                          );
                        }));
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}
