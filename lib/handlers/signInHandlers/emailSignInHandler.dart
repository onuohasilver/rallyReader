import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
signUpWithEmail(String email, String password) async {
  final AuthResult authResult =
      await firebaseAuth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  final FirebaseUser currentUser = authResult.user;
  return currentUser;
}

signInWithEmail(String email, String password) async {
  final AuthResult authResult =
      await firebaseAuth.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
  final FirebaseUser currentUser = authResult.user;
  return currentUser;
}