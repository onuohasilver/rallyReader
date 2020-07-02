import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rallyreader/screens/readScreen.dart';

class BookScreen extends StatefulWidget {
  final String image;
  final String title;

  const BookScreen({
    Key key,
    @required this.image,
    @required this.title,
  }) : super(key: key);
  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    double widthT = MediaQuery.of(context).size.width;
    double heightT = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: heightT,
        width: widthT,
        child: Stack(
          children: <Widget>[
            Container(
              height: heightT * .70,
              width: widthT,
              color: Color(0xFF574497),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: heightT * .09,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                          iconSize: 30,
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(Icons.more_horiz),
                          color: Colors.white,
                          iconSize: 30,
                          onPressed: () {},
                        ),
                      ]),
                  // Container(
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 20.0),
                  //     child: BookImage(
                  //         shadow: true,
                  //         heightT: heightT + (heightT * .4),
                  //         widthT: widthT + (widthT * .4),
                  //         ),
                  //   ),
                  // ),
                  Text(
                    widget.title,
                    style: GoogleFonts.jura(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 3),

                  SizedBox(height: heightT * .06),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                    child: Container(
                      height: heightT * .18,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: heightT * .15,
                            width: widthT * .01,
                            child: Material(
                              color: Colors.black26,
                            ),
                          ),
                          SizedBox(width: heightT * .03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Description',
                                style: GoogleFonts.muli(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: heightT * .01),
                              Container(
                                width: widthT * .75,
                                child: Text(
                                    '''The American Abstract Artists herewith present a fourth in the series of books...
                                ''',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 20)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: widthT * .7,
                      height: heightT * .05,
                      child: Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ReadScreen();
                                  },
                                ),
                              );
                            },
                            splashColor: Colors.pink,
                            child: Center(
                              child: Text(
                                'Read More',
                                style: TextStyle(color: Colors.pink[400]),
                              ),
                            ),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.pink.withOpacity(.3)),
                    ),
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
