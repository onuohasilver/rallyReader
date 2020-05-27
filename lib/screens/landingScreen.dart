import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rallyreader/components/bottomBar.dart';

import 'package:rallyreader/components/thumbnail.dart';

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
            children: <Widget>[
              SizedBox(
                height: heightT * .12,
              ),
              Text(
                'Recent Books.',
                style: GoogleFonts.poppins(
                    fontSize: heightT * .04, fontWeight: FontWeight.w600),
              ),
              Container(
                height: heightT * .24,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ThumbNail(
                        heightT: heightT, widthT: widthT, color: Colors.pink),
                    ThumbNail(
                        heightT: heightT, widthT: widthT, color: Colors.orange),
                    ThumbNail(
                        heightT: heightT, widthT: widthT, color: Colors.purple),
                    ThumbNail(
                        heightT: heightT,
                        widthT: widthT,
                        color: Colors.greenAccent),
                    ThumbNail(
                      heightT: heightT,
                      widthT: widthT,
                      color: Colors.grey,
                    ),
                  ],
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
                child: ListView(
                  children: <Widget>[
                    ExpandedThumbnail(heightT: heightT, widthT: widthT),
                    ExpandedThumbnail(heightT: heightT, widthT: widthT),
                    ExpandedThumbnail(heightT: heightT, widthT: widthT),
                    ExpandedThumbnail(heightT: heightT, widthT: widthT)
                  ],
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

