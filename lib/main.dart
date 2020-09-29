import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/screens/pages/circles/bookCircleScreen.dart';
import 'package:rallyreader/screens/pages/collections/collectionsScreen.dart';
import 'package:rallyreader/screens/pages/circles/individualCircleScreen.dart';
import 'package:rallyreader/screens/pages/collections/individualCollectionScreen.dart';

import 'package:rallyreader/screens/pages/books/landingScreen.dart';
import 'package:rallyreader/screens/pages/books/favoritesScreen.dart';
import 'package:rallyreader/screens/pages/user/profileScreen.dart';
import 'package:rallyreader/screens/pages/user/setProfile.dart';
import 'package:rallyreader/screens/pages/generic/settingsScreen.dart';
import 'package:rallyreader/screens/pages/user/signUp.dart';

import 'handlers/stateHandlers/providers/data.dart';
import 'handlers/stateHandlers/providers/settings.dart';
import 'handlers/stateHandlers/providers/userProfileData.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Data(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserData(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsData(),
        )
      ],
      child: MaterialApp(
        initialRoute: 'SignUp',
        routes: {
          'LandingScreen': (context) => LandingScreen(),
          'CollectionScreen': (context) => Collections(),
          'IndividualCollectionScreen': (context) =>
              IndividualCollectionScreen(),
          'IndividualCircleScreen': (context) => IndividualCircleScreen(),
          'FavoritesScreen': (context) => FavoritesScreen(),
          'ProfileScreen': (context) => ProfileScreen(),
          'SignUp': (context) => SignUp(),
          'BookCircleScreen': (context) => BookCircleScreen(),
          'SetProfile': (context) => SetProfileScreen(),
          'Settings':(context)=>SettingsScreen()        },
      ),
    ),
  );
}

