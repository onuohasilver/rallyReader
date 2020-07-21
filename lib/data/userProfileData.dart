import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String userName;


void setUserName(name){
  userName=name;
  notifyListeners();
}
}
