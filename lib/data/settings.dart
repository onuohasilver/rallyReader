import 'package:flutter/material.dart';

class SettingsData extends ChangeNotifier {
  bool enableSwipe = false,
      swipeHorizontal = false,
      pageSnap = false,
      nightMode=false;
  
  void enableSwiping(){
    enableSwipe=!enableSwipe;
    notifyListeners();
  }

  void setSwipeDirection(){
    swipeHorizontal=!swipeHorizontal;
    notifyListeners();
  }

  void setPageSnap(){
    pageSnap=!pageSnap;
    notifyListeners();
  }

  void setNightMode(){
    nightMode=!nightMode;
    notifyListeners();
  }
}
