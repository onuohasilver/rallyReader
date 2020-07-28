import 'package:flutter/material.dart';

class SettingsData extends ChangeNotifier {
  bool enableSwipe = true,
      swipeHorizontal = true,
      pageSnap = true,
      nightMode=false;
  Color bgColor=Colors.orangeAccent[100].withOpacity(.3),
    blackToWhite=Colors.black,
    whiteToGrey=Colors.white,
    brownToGrey=Colors.brown[800],
    opacityWhiteToGrey=Colors.white.withOpacity(.7),
    opacityBrownToGrey=Colors.brown.withOpacity(.6),
    opacityBlackToWhite=Colors.black.withOpacity(.1),
    whiteToBlack=Colors.white
  ;
  
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
    bgColor=nightMode?Colors.black:Colors.orangeAccent[100].withOpacity(.3);
    blackToWhite=nightMode?Colors.white.withOpacity(.64):Colors.black;
    whiteToBlack=nightMode?Colors.grey[900]:Colors.white;
    whiteToGrey=nightMode?Colors.grey[850]:Colors.white;
    brownToGrey=nightMode ? Colors.grey[900] : Colors.brown[800];
    opacityWhiteToGrey=nightMode?Colors.grey[850]:Colors.white.withOpacity(.7);
    opacityBrownToGrey=nightMode?Colors.grey[850]:Colors.brown.withOpacity(.6);
     opacityBlackToWhite=nightMode?Colors.white.withOpacity(.5):Colors.black.withOpacity(.1);
    notifyListeners();
  }
}
