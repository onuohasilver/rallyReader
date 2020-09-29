import 'package:flutter/cupertino.dart';
import 'package:rallyreader/screens/bookCircleScreen.dart';
import 'package:rallyreader/screens/collectionsScreen.dart';
import 'package:rallyreader/screens/favoritesScreen.dart';
import 'package:rallyreader/screens/individualCircleScreen.dart';
import 'package:rallyreader/screens/individualCollectionScreen.dart';
import 'package:rallyreader/screens/landingScreen.dart';
import 'package:rallyreader/screens/profileScreen.dart';
import 'package:rallyreader/screens/setProfile.dart';
import 'package:rallyreader/screens/settingsScreen.dart';
import 'package:rallyreader/screens/signUp.dart'

class PagePath {
  static get landingPage => LandingScreen();
  static get collectionPage => Collections();
  static get individualCollectionPage => IndividualCollectionScreen();
  static get individualCircleScreen => IndividualCircleScreen();
  static get favoriteScreen => FavoritesScreen();
  static get profileScreen => ProfileScreen();
  static get signUpScreen => SignUp();
  static get bookCircleScreen => BookCircleScreen();
  static get setProfileScreen => SetProfileScreen();
  static get settingScreen => SettingsScreen();
}

navigateTo(Widget path,{argz}){
  CupertinoPageRoute(builder:(context) =>path,settings: argz);
}