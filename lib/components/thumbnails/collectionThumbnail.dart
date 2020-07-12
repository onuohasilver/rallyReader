import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionThumbNail extends StatelessWidget {
  const CollectionThumbNail({
    Key key,
    @required this.height,
    @required this.width,
    @required this.title,
    @required this.numberOfBooks,
    this.image,
    @required this.onLongPress,
    @required this.onTap,
  }) : super(key: key);

  final double height;
  final double width;
  final String title;
  final int numberOfBooks;
  final String image;
  final Function onTap;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: height * .2,
              width: width / 2.5,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 5,
                shadowColor: Colors.grey[100],
                child: Ink.image(
                  image: image ?? AssetImage('assets/topUserImage.png'),
                  fit: BoxFit.cover,
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(sigmaX: 1.7, sigmaY: 1.9),
                    child: InkWell(
                      child: Text(
                        '.',
                        style: TextStyle(color: Colors.transparent),
                      ),
                      onTap: onTap,
                      onLongPress: onLongPress,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          right: 20,
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
                elevation: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    numberOfBooks.toString(),
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: height * .0184,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          bottom: 16,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 5),
              child: Container(
                width: width * .4,
                height: height * .04,
                decoration: BoxDecoration(
                  color: Colors.orange[100].withOpacity(.7),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
