import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rallyreader/components/imageContainers/bookImage.dart';
import 'package:rallyreader/screens/readScreen.dart';

class BookScreen extends StatefulWidget {
  final String image;
  final String title;
  final String path;

  const BookScreen({
    Key key,
    @required this.image,
    @required this.title,
    this.path,
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
              color: Colors.orange[100],
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
                  SizedBox(
                    height: heightT * .02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      height: heightT * .54,
                      width: widthT * .7,
                      child: BookImage(
                        path: widget.path,
                        shadow: true,
                        heightT: heightT + (heightT * .6),
                        widthT: widthT + (widthT * .4),
                      ),
                    ),
                  ),
                  Text(
                    widget.title,
                    style: GoogleFonts.jura(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 3),
                  SizedBox(height: heightT * .06),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: widthT * .7,
                      height: heightT * .05,
                      child: Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ReadScreen(path: widget.path);
                                  },
                                ),
                              );
                            },
                            splashColor: Colors.orange,
                            child: Center(
                              child: Text(
                                'Read More',
                                style: TextStyle(color: Colors.orange[700]),
                              ),
                            ),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.orange.withOpacity(.3)),
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
