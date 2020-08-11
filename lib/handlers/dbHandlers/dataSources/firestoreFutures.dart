import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';




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

///Upload files to Firebase storage and save the URL links in firebase database
Future uploadFile(File file, String path, {String circle}) async {
  StorageReference storageReference =
      FirebaseStorage.instance.ref().child('books/${path.split('/').last}');
  Firestore firestore = Firestore.instance;
  // String imagePath = await generateImage(path);
  // File bookImage = File(imagePath);

  StorageReference storageReferenceImages =
      FirebaseStorage.instance.ref().child('image/${path.split('/').last}');
  StorageUploadTask uploadBook = storageReference.putFile(file);
  // StorageUploadTask uploadImage = storageReferenceImages.putFile(bookImage);
  await uploadBook.onComplete;
  // await uploadImage.onComplete;

  print('File Uploaded');
  storageReference.getDownloadURL().then((fileURL) async {
    List books = [];

    await firestore
        .collection('namedCollections')
        .document(
          circle,
        )
        .get()
        .then((value) => books = value['books']);
    books.add(fileURL);
    firestore
        .collection('namedCollections')
        .document(
          circle,
        )
        .setData({'books': books}, merge: true);
  });

  storageReferenceImages.getDownloadURL().then((fileURL) async {
    List bookImage = [];

    await firestore
        .collection('namedCollections')
        .document(
          circle,
        )
        .get()
        .then((value) => bookImage = value['bookImage']);
    bookImage.add(fileURL);
    firestore
        .collection('namedCollections')
        .document(
          circle,
        )
        .setData({'bookImage': [fileURL]}, merge: true);
  });
}
