import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/imageContainers/bookImage.dart';
import 'package:rallyreader/components/popups/addCollections.dart';
import 'package:rallyreader/components/progressIndicator.dart';
import 'package:rallyreader/data/data.dart';
import 'package:rallyreader/screens/viewScreen.dart';

class ThumbNail extends StatelessWidget {
  const ThumbNail({
    @required this.heightT,
    @required this.widthT,
    @required this.path,
  });

  final double heightT;
  final double widthT;

  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          BookImage(
            key: key,
            shadow: false,
            heightT: heightT,
            widthT: widthT,
            path: path,
          ),
        ],
      ),
    );
  }
}

class ExpandedThumbnail extends StatelessWidget {
  const ExpandedThumbnail(
      {@required this.heightT,
      @required this.widthT,
      @required this.title,
      @required this.path,
      @required this.completion,
      @required this.key,
      @required this.showMenu,
      this.onTap,
      @required this.scaffoldKey})
      : super(key: key);

  final double heightT;
  final double widthT;
  final String title;
  final double completion;
  final String path;
  final Function onTap;
  final GlobalKey key;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool showMenu;

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<Data>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white.withOpacity(.7)),
        child: Row(
          children: <Widget>[
            BookImage(
              key: key,
              shadow: false,
              heightT: heightT,
              widthT: widthT,
              path: path,
              onTap: onTap,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: heightT * .05,
                      width: widthT * .6,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: GoogleFonts.hindMadurai(
                            fontSize: heightT * .018,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Container(
                          width: widthT * .55,
                          child: CurvedLinearProgressIndicator(
                              widthT: widthT * 1.8,
                              value: completion,
                              read: false,
                              readColor: Colors.orange)),
                    ),
                    showMenu
                        ? Container(
                            width: widthT * .55,
                            height: heightT * .04,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(
                                      Icons.favorite,
                                      color: (appData.favorites.contains(title))
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      appData.setFavorite(scaffoldKey, title);
                                    }),
                                IconButton(
                                    icon: Icon(
                                      Icons.av_timer,
                                      color: (appData.toRead.contains(title))
                                          ? Colors.orange
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      appData.addToReadinglist(
                                          scaffoldKey, title);
                                    }),
                                IconButton(
                                    icon: Icon(
                                      Icons.library_books,
                                    ),
                                    onPressed: () {
                                      addToCollection(
                                          context, heightT, widthT, title);
                                    }),
                                PopupMenuButton(
                                  onSelected: (value) {
                                    print(value);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return BookScreen(
                                        title: ' book.title',
                                        image: "book.image",
                                      );
                                    }));
                                  },
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        value: 's',
                                        child: Text('Scales'),
                                      ),
                                      PopupMenuItem(
                                        value: 'saa',
                                        child: Text('Scales'),
                                      ),
                                    ];
                                  },
                                )
                              ],
                            ))
                        : Container(height: 0, width: 0)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
