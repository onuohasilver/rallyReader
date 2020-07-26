import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rallyreader/data/userProfileData.dart';

Firestore firestore = Firestore.instance;
/// update the circle information on firebase
/// the namedCollections document is updated,
/// the current user circles is updated
/// the general circle collection is updated
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

  ///retrieve the document containing
  ///the circles that the current user was 
  ///previously a member of
  List previousCircles = await firestore
      .collection('users')
      .document(userData.currentUserId)
      .get()
      .then((value) => value['circles']);
  previousCircles.add(circleName);
  /// retrieve the namedCollections
  /// from firebase and add the newly created circle 
  /// for re-uploading
  List circlesMap = await firestore
      .collection('namedCollections')
      .document('namedCircles')
      .get()
      .then((value) => value['circles']);
  circlesMap.add(
    {
      'members':[userData.userName],
      'name':circleName
      
    },
  );

  /// update the contents of the users
  /// circle membership
  firestore
      .collection('users')
      .document(userData.currentUserId)
      .setData({'circles': previousCircles}, merge: true);

  ///update the named collections document
  ///with the newly created circle
  firestore
      .collection('namedCollections')
      .document('namedCircles')
      .setData({'circles': circlesMap}, merge: true);
}
