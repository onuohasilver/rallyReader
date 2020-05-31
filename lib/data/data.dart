import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  List<String> filePath = [];

  updateFiles(files) {
    filePath = files;
    notifyListeners();
  }
}
