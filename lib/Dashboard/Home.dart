import 'dart:ffi';

import 'package:cineverse/Firebase/FirebaseAuth.dart';
import 'package:cineverse/Login%20&%20Signup/login.dart';
import 'package:cineverse/Models/UserModel.dart' as model;
import 'package:cineverse/Providers/UserProvider.dart';
import 'package:cineverse/Utils/Colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    model.UserModel userInfo =
        Provider.of<UserProvider>(context, listen: false).getUserModel;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "This is me ${userInfo.user}, ${userInfo.phoneNumber}, ${userInfo.email}",
                //"Text",
                style: const TextStyle(
                    color: backgroundColor, fontFamily: "Poppins"),
              ),
            ),
            GestureDetector(
              onTap: () {
                signout();
              },
              child: const Text("Logout",
                  style: TextStyle(color: backgroundColor)),
            )
          ],
        ),
      ),
    );
  }

  void signout() async {
    //User? user = FirebaseAuth.instance.currentUser;
    //print(user?.displayName.toString());

    FirebaseService firebaseService = FirebaseService();
    await firebaseService.GoogleSignOut();

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const LoginPage())));
    }
  }
}
