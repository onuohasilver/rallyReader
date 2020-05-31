import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/screens/landingScreen.dart';

import 'data/data.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Data(),
      child: MaterialApp(
        home: LandingScreen(),
        routes: {
          'LandingScreen': (context) => LandingScreen(),
        },
      ),
    ),
  );
}

// class GetA extends StatefulWidget {
//   @override
//   _GetAState createState() => _GetAState();
// }

// class _GetAState extends State<GetA> {
//   Future<List<Directory>> externalStorage = getExternalStorageDirectories();
//   final Permission permissionHandler = Permission.storage;
//   PermissionStatus _permissionStatus;
//   @override
//   void initState() {
//     super.initState();
//     requestPermission(permissionHandler);
//   }

//   Future<void> requestPermission(Permission permission) async {
//     final status = await permission.request();

//     setState(() {
//       print(status);
//       _permissionStatus = status;
//       print(_permissionStatus);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Directory dir = Directory('/storage/emulated/0/');
//     String pathX = dir.toString();
//     print(pathX);
//     List<FileSystemEntity> fileX;
//     List<FileSystemEntity> pdfFileX = [];
//     fileX = dir.listSync(recursive: true, followLinks: false);
//     for (FileSystemEntity entity in fileX) {
//       String path = entity.path;
//       pdfFileX.add(entity);
//       if (path.endsWith('pdf')) {
//         print(path);
//       }
//     }

//     return Scaffold(
//       body: Center(
//         child: RaisedButton(
//           onPressed: () {
//             requestPermission(permissionHandler);
//           },
//         ),
//       ),
//     );
//   }
// }
