import 'package:cloud_firestore/cloud_firestore.dart';

Firestore firestore = Firestore.instance;
Future circlesFuture = firestore
    .collection('namedCollections')
    .document(
      'namedCircles',
    )
    .get();

Future previousCircles = firestore
    .collection('users')
    .document('Ecd6yjiIkQOmQRNvouDhxLrvnlf1')
    .get();
