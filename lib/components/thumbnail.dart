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
          CurvedLinearProgressIndicator(widthT: widthT,heightT: heightT,)
        ],
      ),
    );
  }
}


class ExpandedThumbnail extends StatelessWidget {
  const ExpandedThumbnail({
    Key key,
    @required this.heightT,
    @required this.widthT,
  }) : super(key: key);

  final double heightT;
  final double widthT;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,20),
      child: Container(
        child: Row(
          children: <Widget>[
            BookImage(
                heightT: heightT,
                widthT: widthT,
                color: Colors.blueGrey),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Book of Bera',
                    style: GoogleFonts.poppins(
                        fontSize: heightT * .022,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Suzie Wilde',
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
                              '1200L',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                            color: Colors.lightGreen,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.orangeAccent,
                              ),
                              Text(
                                '5.0',
                                style: TextStyle(color: Colors.black87),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.ac_unit,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                '89',
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
                    child:
                        CurvedLinearProgressIndicator(widthT: widthT),
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
