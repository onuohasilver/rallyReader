import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  List<String> filePath = [];

  void updateFiles(files) {
    filePath = files;
    notifyListeners();
  }
}
