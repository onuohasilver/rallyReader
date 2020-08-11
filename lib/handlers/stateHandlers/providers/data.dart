import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render.dart';

import 'package:rallyreader/screens/popups/snackbars.dart';

///Basic AppData State Handler
class Data extends ChangeNotifier {
  /// [List] File Paths that were recovered from the
  List<String> filePath = [];

  List<Map<String, PdfPageImage>> bookMap = [];

  ///[List] containing the favorited bookTitlePaths
  List favorites = [];

  ///[List] containing the bookTitlePaths for books to be read.
  List toRead = [];

  ///[bool] tracking the state of an observed modal
  bool showingModal = false;

  ///[bool] tracking the state of the progress
  bool progressComplete = false;

  ///[Map] collection <caches> of books
  Map<String, List<String>> caches = {'Default': []};

  ///add all retrieved filePaths to a central repository
  ///accesible across the app state
  void updateFiles(List<String> files) {
    filePath = files;
    notifyListeners();
  }

  /// create a map containing the generate bookImage
  /// and the corresponding local book path

  void updateBookImages(Map<String, PdfPageImage> map) {
    bookMap.add(map);
  }

  ///add [bookTitle] to [favorites] list and trigger [SnackBar] displays
  ///checks for conditions whether the bookTitle is already present
  ///in the [favorites] list

  void setFavorite(GlobalKey<ScaffoldState> key, String bookTitle) {
    ///add the [bookTitle] to the [favorites] if it is absent.

    if (!favorites.contains(bookTitle)) {
      favorites.add(bookTitle);
      showSnackBar(key, 'Added to favorites');
    } else {
      ///remove the [bookTitle] from the [favorites] if it is present

      favorites.remove(bookTitle);
      showSnackBar(key, 'Removed from favorites');
    }
    notifyListeners();
  }

  ///add [bookTitle] to [toRead] list and trigger [SnackBar] displays
  ///checks for conditions whether the bookTitle is already present
  ///in the [toRead] list

  void addToReadinglist(GlobalKey<ScaffoldState> key, String bookTitle) {
    ///add the [bookTitle] to the [toRead] if it is absent.

    if (!toRead.contains(bookTitle)) {
      toRead.add(bookTitle);
      showSnackBar(key, 'Added to Reading List!');
    } else {
      ///remove the [bookTitle] from the [toRead] if it is present

      toRead.remove(bookTitle);
      showSnackBar(key, 'Removed Reading List!');
    }
    notifyListeners();
  }

  ///Creates a book collection and adds [bookTitle] to it.
  ///also checks for conditions where the collection might have
  ///initially existed

  void createCollection(String collectionName, String bookTitle) {
    ///if the collection name entered doesn't exist
    ///the collection is created and the book title is added to it

    if (caches[collectionName] == null) {
      caches[collectionName] = [];
      caches[collectionName].add(bookTitle);
    } else {
      ///check if the title is already in the collection
      ///and add if the condition is not true

      caches.containsValue(bookTitle)
          ? Container()
          : [collectionName].add(bookTitle);
    }
    notifyListeners();
  }

  /// [bool] observe the state of a displayed modal
  /// to determine when a gesture detector trigger should
  /// be used to control its display

  void showModal() {
    showingModal = !showingModal;
    notifyListeners();
  }

  /// [bool] observe the state of a future
  /// linking --- with other widgets like the [ModalProgressHUD] to
  /// show progress Indicators

  void progress() {
    progressComplete = !progressComplete;
    notifyListeners();
  }
}
