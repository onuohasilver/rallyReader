import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/screens/bookCircleScreen.dart';
import 'package:rallyreader/screens/collectionsScreen.dart';
import 'package:rallyreader/screens/individualCircleScreen.dart';
import 'package:rallyreader/screens/individualCollectionScreen.dart';

import 'package:rallyreader/screens/landingScreen.dart';
import 'package:rallyreader/screens/favoritesScreen.dart';
import 'package:rallyreader/screens/profileScreen.dart';
import 'package:rallyreader/screens/setProfile.dart';
import 'package:rallyreader/screens/signUp.dart';
import 'data/data.dart';
import 'data/userProfileData.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Data(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserData(),
        )
      ],
      child: MaterialApp(
        initialRoute: 'SignUp',
        routes: {
          'LandingScreen': (context) => LandingScreen(),
        
          'CollectionScreen': (context) => Collections(),
          'IndividualCollectionScreen': (context) =>
              IndividualCollectionScreen(),
          'IndividualCircleScreen': (context) => IndividualCircleScreen(),
          'FavoritesScreen': (context) => FavoritesScreen(),
          'ProfileScreen': (context) => ProfileScreen(),
          'SignUp': (context) => SignUp(),
          'BookCircleScreen': (context) => BookCircleScreen(),
          'SetProfile': (context) => SetProfileScreen()
        },
      ),
    ),
  );
}

// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String pathPDF = "";
//   String remotePDFpath = "";
//   String corruptedPathPDF = "";

//   @override
//   void initState() {
//     super.initState();
//     fromAsset('assets/corrupted.pdf', 'corrupted.pdf').then((f) {
//       setState(() {
//         corruptedPathPDF = f.path;
//       });
//     });
//     fromAsset('assets/demo-link.pdf', 'demo.pdf').then((f) {
//       setState(() {
//         pathPDF = f.path;
//       });
//     });

//     createFileOfPdfUrl().then((f) {
//       setState(() {
//         remotePDFpath = f.path;
//       });
//     });
//   }

//   Future<File> createFileOfPdfUrl() async {
//     Completer<File> completer = Completer();
//     print("Start download file from internet!");
//     try {
//       // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
//       // final url = "https://pdfkit.org/docs/guide.pdf";
//       final url = "http://www.pdf995.com/samples/pdf.pdf";
//       final filename = url.substring(url.lastIndexOf("/") + 1);
//       var request = await HttpClient().getUrl(Uri.parse(url));
//       var response = await request.close();
//       var bytes = await consolidateHttpClientResponseBytes(response);
//       var dir = await getApplicationDocumentsDirectory();
//       print("Download files");
//       print("${dir.path}/$filename");
//       File file = File("${dir.path}/$filename");

//       await file.writeAsBytes(bytes, flush: true);
//       completer.complete(file);
//     } catch (e) {
//       throw Exception('Error parsing asset file!');
//     }

//     return completer.future;
//   }

//   Future<File> fromAsset(String asset, String filename) async {
//     // To open from assets, you can copy them to the app storage folder, and the access them "locally"
//     Completer<File> completer = Completer();

//     try {
//       var dir = await getApplicationDocumentsDirectory();
//       File file = File("${dir.path}/$filename");
//       var data = await rootBundle.load(asset);
//       var bytes = data.buffer.asUint8List();
//       await file.writeAsBytes(bytes, flush: true);
//       completer.complete(file);
//     } catch (e) {
//       throw Exception('Error parsing asset file!');
//     }

//     return completer.future;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter PDF View',
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Plugin example app')),
//         body: Center(child: Builder(
//           builder: (BuildContext context) {
//             return Column(
//               children: <Widget>[
//                 RaisedButton(
//                   child: Text("Open PDF"),
//                   onPressed: () {
//                     if (pathPDF != null || pathPDF.isNotEmpty) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => PDFScreen(path: pathPDF),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//                 RaisedButton(
//                   child: Text("Remote PDF"),
//                   onPressed: () {
//                     if (remotePDFpath != null || remotePDFpath.isNotEmpty) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => PDFScreen(path: remotePDFpath),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//                 RaisedButton(
//                   child: Text("Open Corrupted PDF"),
//                   onPressed: () {
//                     if (pathPDF != null) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               PDFScreen(path: corruptedPathPDF),
//                         ),
//                       );
//                     }
//                   },
//                 )
//               ],
//             );
//           },
//         )),
//       ),
//     );
//   }
// }

