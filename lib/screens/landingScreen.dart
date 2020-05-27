import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rallyreader/components/bottomBar.dart';

import 'package:rallyreader/components/thumbnail.dart';
import 'package:rallyreader/collections/books.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    double heightT = MediaQuery.of(context).size.height;
    double widthT = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: heightT,
        width: widthT,
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
                    fontSize: heightT * .04, fontWeight: FontWeight.w600),
              ),
              Container(
                height: heightT * .26,
                child: ListView.builder(
                  itemCount: bookList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return ThumbNail(
                      image: bookList[index].image,
                      heightT: heightT,
                      widthT: widthT,
                    );
                  },
                ),
              ),
              SizedBox(
                height: heightT * .02,
              ),
              Text(
                'All Books',
                style: GoogleFonts.poppins(
                    fontSize: heightT * .025, fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: bookList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var book=bookList[index];
                    return ExpandedThumbnail(
                        heightT: heightT,
                        widthT: widthT,
                        title: book.title,
                        author: book.author,
                        pages: book.pages,
                        rating: book.rating,
                        image: book.image,
                        favorite: book.favorite,
                        completion: book.completion);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
