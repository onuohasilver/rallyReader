import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/screens/collectionsScreen.dart';
import 'package:rallyreader/screens/individualCollectionScreen.dart';
import 'package:rallyreader/screens/initialScreen.dart';
import 'package:rallyreader/screens/landingScreen.dart';

import 'data/data.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Data(),
      child: MaterialApp(
        initialRoute: 'LandingScreen',
        routes: {
          'LandingScreen': (context) => LandingScreen(),
          'InitialScreen': (context)=> InitialScreen(),
          'CollectionScreen':(context)=> Collections(),
          'IndividualCollectionScreen':(context)=>IndividualCollectionScreen()
        },
      ),
    ),
  );
}

// import 'dart:async';
// import 'dart:convert';
// import 'dart:typed_data';
// import 'dart:ui' as ui;

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   GlobalKey _globalKey = new GlobalKey();

//   Future<Uint8List> _capturePng() async {
//     try {
//       print('inside');
//       RenderRepaintBoundary boundary =
//           _globalKey.currentContext.findRenderObject();
//       ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//       ByteData byteData =
//           await image.toByteData(format: ui.ImageByteFormat.png);
//       var pngBytes = byteData.buffer.asUint8List();
//       var bs64 = base64Encode(pngBytes);
//       print(pngBytes);
//       print(bs64);
//       setState(() {});
//       return pngBytes;
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RepaintBoundary(
//       key: _globalKey,
//       child: new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Widget To Image demo'),
//         ),
//         body: new Center(
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Text(
//                 'click below given button to capture iamge',
//               ),
//               new RaisedButton(
//                 child: Text('capture Image'),
//                 onPressed: _capturePng,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }