import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:rallyreader/components/popups/snackbars.dart';

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

  void setFavorite(BuildContext context,String  bookTitle) {
    if (!favorites.contains(bookTitle)) {
      favorites.add(bookTitle);
      showSnackBar(context, 'Added to favorites');
    } else {
      favorites.remove(bookTitle);
      showSnackBar(context, 'Removed from favorites');
    }
    notifyListeners();
  }
  void addToReadinglist(BuildContext context,String bookTitle){
    if (!toRead.contains(bookTitle)) {
      toRead.add(bookTitle);
      showSnackBar(context, 'Added to Reading List!');
    } else {
      toRead.remove(bookTitle);
      showSnackBar(context, 'Removed Reading List!');
    }
    notifyListeners();

  }

  void createCollection(String collectionName,String  bookTitle) {
    caches[collectionName]=[];
    caches[collectionName].add(bookTitle);
    notifyListeners();
  }
}
