import 'package:flutter/cupertino.dart';
import 'package:rallyreader/screens/pages/circles/bookCircleScreen.dart';
import 'package:rallyreader/screens/pages/collections/collectionsScreen.dart';
import 'package:rallyreader/screens/pages/books/favoritesScreen.dart';
import 'package:rallyreader/screens/pages/circles/individualCircleScreen.dart';
import 'package:rallyreader/screens/pages/collections/individualCollectionScreen.dart';
import 'package:rallyreader/screens/pages/books/landingScreen.dart';
import 'package:rallyreader/screens/pages/user/profileScreen.dart';
import 'package:rallyreader/screens/pages/user/setProfile.dart';
import 'package:rallyreader/screens/pages/generic/settingsScreen.dart';
import 'package:rallyreader/screens/pages/user/signUp.dart';

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

navigateTo(Widget path, {argz}) {
  CupertinoPageRoute(builder: (context) => path, settings: argz);
}
