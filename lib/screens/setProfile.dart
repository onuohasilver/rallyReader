import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/data/data.dart';
import 'package:rallyreader/data/userProfileData.dart';
import 'package:rallyreader/handlers/handlers.dart';

class SetProfileScreen extends StatefulWidget {
  @override
  _SetProfileScreenState createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String currentUserID;
  GetPermission getPermission = GetPermission();
  List<String> fileNames;
  TextEditingController userName = TextEditingController();
  @override
  void initState() {
    getCurrentUser() async {
      FirebaseUser currentUser = await auth.currentUser();
      currentUserID = currentUser.uid;
    }

    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    UserData userData = Provider.of<UserData>(context);
    Data appData = Provider.of<Data>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userData.setCurrentUserID(currentUserID);
    });

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: appData.progressComplete,
        child: Container(
          height: height,
          width: width,
          color: Colors.orange[100],
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: width * .8,
                    child: TextField(
                      controller: userName,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: width * .05),
                      decoration: InputDecoration(
                        hintText: 'choose a username',
                        hintStyle: GoogleFonts.poppins(fontSize: width * .06),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 40),
                    child: Material(
                      shape: CircleBorder(),
                      color: Colors.grey[100].withOpacity(.2),
                      child: Container(
                        height: height * .09,
                        width: width * .3,
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              appData.progress();
                              firestore
                                  .collection('users')
                                  .document(currentUserID)
                                  .setData({
                                'username': userName.text,
                                'circles': ['default']
                              }, merge: true);
                              userData.setUserName(userName.text);
                              getPermission.requestPermission;
                              fileNames = getPermission.getFileList;
                              appData.updateFiles(fileNames);
                              appData.progress();
                              Navigator.pushReplacementNamed(
                                  context, 'LandingScreen');
                            },
                            icon: Icon(Icons.arrow_forward, size: width * .09),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
