import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String userName;
  String currentUserId;


void setUserName(String name){
  userName=name;
  notifyListeners();
}

void setCurrentUserID(String userID){
  currentUserId=userID;
  notifyListeners();

}
}
