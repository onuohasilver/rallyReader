import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rallyreader/data/userProfileData.dart';

Firestore firestore = Firestore.instance;

updateCircle(UserData userData, String circleName) async {
  firestore
      .collection(
        'circles',
      )
      .document(circleName)
      .setData({
    'CircleAuthor': userData.userName,
    'CircleAuthorID': userData.currentUserId
  }, merge: true);
  List previousCircles = await firestore
      .collection('users')
      .document(userData.currentUserId)
      .get()
      .then((value) => value['circles']);
  previousCircles.add(circleName);
  firestore
      .collection('users')
      .document(userData.currentUserId)
      .setData({'circles': previousCircles}, merge: true);
  
}
