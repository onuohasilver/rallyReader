import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class Data extends ChangeNotifier {
  List<String> filePath = [];
  List<PdfController> controllers = [];

  void updateFiles(files) {
    filePath = files;
    notifyListeners();
  }
  void updateControllers(controller){
    controllers.add(controller);
    notifyListeners();
  }
}
