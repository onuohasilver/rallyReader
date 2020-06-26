import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/screens/initialScreen.dart';
import 'package:rallyreader/screens/landingScreen.dart';

import 'data/data.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Data(),
      child: MaterialApp(
        initialRoute: 'InitialScreen',
        routes: {
          'LandingScreen': (context) => LandingScreen(),
          'InitialScreen': (context)=> InitialScreen()
        },
      ),
    ),
  );
}
