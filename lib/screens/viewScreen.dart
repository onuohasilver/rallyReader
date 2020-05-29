import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rallyreader/components/bookImage.dart';

class BookScreen extends StatefulWidget {
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
              height: heightT * .75,
              width: widthT,
              color: Color(0xFF574497),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: heightT * .10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back, color: Colors.white, size: 30),
                        Icon(Icons.more_horiz, color: Colors.white, size: 30),
                      ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: BookImage(
                        heightT: heightT + (heightT * .4),
                        widthT: widthT + (widthT * .4),
                        image: 'assets/demoCoverr.jpg'),
                  ),
                  Text(
                    'The Midnight War',
                    style: GoogleFonts.jura(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height:3),
                  Text(
                    'Susan Wildes',
                    style: GoogleFonts.jura(
                        color: Colors.grey[400],
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  



Row(
   mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: heightT * .04,
                          width: widthT * .15,
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            child: Center(
                                child: Text(
                              '120',
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
                                color: Colors.deepOrange,
                              ),
                              Text(
                                '5',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.favorite,
                                color: Colors.redAccent
                              ),
                              Text(
                                '20',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),



                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
