import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:rallyreader/components/popups/snackbars.dart';

class Data extends ChangeNotifier {
  List<String> filePath = [];
  List<PdfController> controllers = [];
  List pdfImages = [1, 2, 3];
  List favorites = [];
  List toRead = [];
  bool showingModal=false;
  Map<String, List<String>> caches = {'Default': []};

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

  void setFavorite(GlobalKey<ScaffoldState> key, String bookTitle) {
    if (!favorites.contains(bookTitle)) {
      favorites.add(bookTitle);
      showSnackBar(key, 'Added to favorites');
    } else {
      favorites.remove(bookTitle);
      showSnackBar(key, 'Removed from favorites');
    }
    notifyListeners();
  }

  void addToReadinglist(GlobalKey<ScaffoldState> key, String bookTitle) {
    if (!toRead.contains(bookTitle)) {
      toRead.add(bookTitle);
      showSnackBar(key, 'Added to Reading List!');
    } else {
      toRead.remove(bookTitle);
      showSnackBar(key, 'Removed Reading List!');
    }
    notifyListeners();
  }

  void createCollection(String collectionName, String bookTitle) {
    if (caches[collectionName] == null) {
      caches[collectionName] = [];
      caches[collectionName].add(bookTitle);
    } else {
      //TODO: check if the title is already in the collection
      caches[collectionName].add(bookTitle);
    }

    notifyListeners();
  }

  void showModal(){
    showingModal=!showingModal;
    notifyListeners();
  }
}
