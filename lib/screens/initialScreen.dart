import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/data/data.dart';
import 'package:rallyreader/handlers/handlers.dart';
import 'package:rallyreader/screens/landingScreen.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  GetPermission getPermission = GetPermission();
  List<String> fileNames;

  @override
  void initState() {
    getPermission.requestPermission;
    fileNames = getPermission.getFileList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightT = MediaQuery.of(context).size.height;
    double widthT = MediaQuery.of(context).size.width;
    final appData = Provider.of<Data>(context);
    appData.updateFiles(fileNames);
    return Scaffold(
      body: Container(
        height: heightT,
        width: widthT,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  for (String file in fileNames) {
                    PdfController pdfController = PdfController(
                        document: PdfDocument.openFile(file),
                        viewportFraction: 1.0);
                    appData.updateControllers(pdfController);
                  }
                },
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LandingScreen();
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
