import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/buttons/topRowButton.dart';
import 'package:rallyreader/components/popups/drawer.dart';
import 'package:rallyreader/components/text/pageTitles.dart';

import 'package:rallyreader/data/data.dart';

class BookCircleScreen extends StatefulWidget {
  @override
  _BookCircleScreenState createState() => _BookCircleScreenState();
}

class _BookCircleScreenState extends State<BookCircleScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Data appData = Provider.of<Data>(context);
    animationController.forward();
    return Scaffold(
      drawer: DrawerBuilder(widthT: width, heightT: height),
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        elevation: 30,
        onPressed: () {},
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.orangeAccent[100].withOpacity(.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TopRowButton(height: height, scaffoldKey: scaffoldKey),
              PageTitle(heightT: height, title: 'My Circles'),
              Expanded(
                child: GlowingOverscrollIndicator(
                  axisDirection: AxisDirection.down,
                  color: Colors.deepOrange,
                  child: ListView(children: [
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Circle(
                          height: height,
                          width: width,
                          color: Colors.green,
                          animation: animation, label: 'Top Niggas',
                        ),
                        Circle(
                          height: height * .5,
                          width: width * .5,
                          color: Colors.purple,
                          animation: animation, label: 'Rolling Men',
                        ),
                        Circle(
                          height: height * 1.5,
                          width: width * 1.5,
                          color: Colors.orange,
                          animation: animation, label: 'Deeep Fried',
                        )
                      ],
                    ),
                    Spacer(),
                    PageTitle(heightT: height, title: 'All Circles'),
                     Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         Circle(
                          height: height * 1.5,
                          width: width * 1.5,
                          color: Colors.orange,
                          animation: animation, label: 'Deeep Fried',
                        ),
                        Circle(
                          height: height,
                          width: width,
                          color: Colors.green,
                          animation: animation, label: 'Top Niggas',
                        ),
                        Circle(
                          height: height * .5,
                          width: width * .5,
                          color: Colors.purple,
                          animation: animation, label: 'Rolling Men',
                        ),
                       
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Circle extends StatelessWidget {
  const Circle({
    Key key,
    @required this.height,
    @required this.width,
    @required this.color,
    @required this.animation,
    @required this.label,
  }) : super(key: key);

  final double height;
  final double width;
  final Color color;
  final Animation animation;
  final String label;
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: Material(
        elevation: 40,
        type: MaterialType.circle,
        color: color ?? Colors.green,
        child: Container(
          height: height * .12,
          width: width * .25,
          child: InkWell(
            customBorder: CircleBorder(),
            child: Center(
              child: Text(
                label,
                style: GoogleFonts.poppins(
                    color: Colors.white, fontSize: width * .03),
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
