import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rallyreader/components/progressIndicator.dart';

import 'bookImage.dart';

class ThumbNail extends StatelessWidget {
  const ThumbNail({
    Key key,
    @required this.heightT,
    @required this.widthT,
    @required this.color,
  }) : super(key: key);

  final double heightT;
  final double widthT;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
      child: Column(
        children: <Widget>[
          BookImage(heightT: heightT, widthT: widthT, color: color),
          SizedBox(
            height: heightT * .014,
          ),
          CurvedLinearProgressIndicator(
              widthT: widthT * .6, heightT: heightT, value: .45)
        ],
      ),
    );
  }
}

class ExpandedThumbnail extends StatelessWidget {
  const ExpandedThumbnail(
      {Key key,
      @required this.heightT,
      @required this.widthT,
      @required this.title,
      @required this.author,
      @required this.pages,
      @required this.rating,
      @required this.favorite,
      @required this.completion})
      : super(key: key);

  final double heightT;
  final double widthT;
  final String title;
  final String author;
  final int pages;
  final double rating;
  final int favorite;
  final double completion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Container(
        child: Row(
          children: <Widget>[
            BookImage(heightT: heightT, widthT: widthT, color: Colors.blueGrey),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                        fontSize: heightT * .022, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    author,
                    style: GoogleFonts.poppins(
                        fontSize: heightT * .022,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[400]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: heightT * .04,
                          width: widthT * .15,
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            child: Center(
                                child: Text(
                              '$pages L',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                            color: Colors.lightGreen,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.orangeAccent,
                              ),
                              Text(
                                '$rating',
                                style: TextStyle(color: Colors.black87),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.ac_unit,
                                color: Colors.lightBlueAccent,
                              ),
                              Text(
                                '$favorite',
                                style: TextStyle(color: Colors.black87),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: widthT * .5,
                    child: CurvedLinearProgressIndicator(
                        widthT: widthT, value: completion),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
