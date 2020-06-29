import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class Data extends ChangeNotifier {
  List<String> filePath = [];
  List<PdfController> controllers = [];
  List pdfImages=[1,2,3];

  void updateFiles(files) {
    filePath = files;
    notifyListeners();
  }
  void updateControllers(controller){
    controllers.add(controller);
    notifyListeners();
  }
  void updatePdfImages(renderedObject){
    pdfImages.add(renderedObject);


  }
}
