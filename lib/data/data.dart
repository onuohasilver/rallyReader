import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class Data extends ChangeNotifier {
  List<String> filePath = [];
  List<PdfController> controllers = [];
  List pdfImages = [1, 2, 3];
  List favorites = [];
  List toRead=[];
  Map<String, List<String>> caches = {};

  void updateFiles(files) {
    filePath = files;
    notifyListeners();
  }

  void updateControllers(controller) {
    controllers.add(controller);
    notifyListeners();
  }

  void updatePdfImages(renderedObject) {
    pdfImages.add(renderedObject);
  }

  void setFavorite(bookTitle) {
    if (!favorites.contains(bookTitle)) {
      favorites.add(bookTitle);
    } else {
      favorites.remove(bookTitle);
    }
    notifyListeners();
  }
  void addToReadinglist(bookTitle){
    if (!toRead.contains(bookTitle)) {
      toRead.add(bookTitle);
    } else {
      toRead.remove(bookTitle);
    }
    notifyListeners();

  }

  void createCollection(collectionName, bookTitle) {
    caches[collectionName].add(bookTitle);
    notifyListeners();
  }
}
