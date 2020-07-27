import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/data/settings.dart';
import 'package:rallyreader/screens/bookCircleScreen.dart';
import 'package:rallyreader/screens/collectionsScreen.dart';
import 'package:rallyreader/screens/individualCircleScreen.dart';
import 'package:rallyreader/screens/individualCollectionScreen.dart';

import 'package:rallyreader/screens/landingScreen.dart';
import 'package:rallyreader/screens/favoritesScreen.dart';
import 'package:rallyreader/screens/profileScreen.dart';
import 'package:rallyreader/screens/setProfile.dart';
import 'package:rallyreader/screens/signUp.dart';
import 'data/data.dart';
import 'data/userProfileData.dart';

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
          'SetProfile': (context) => SetProfileScreen()
        },
      ),
    ),
  );
}

