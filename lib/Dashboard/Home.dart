import 'dart:ffi';

import 'package:cineverse/Dashboard/Firebase/FirebaseAuth.dart';
import 'package:cineverse/Login%20&%20Signup/login.dart';
import 'package:cineverse/Utils/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text("This is me the user"),
            ),
            GestureDetector(
              onTap: () {
                signout();
              },
              child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }

  void signout() async {
    FirebaseService firebaseService = FirebaseService();
    await firebaseService.GoogleSignOut();

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const LoginPage())));
    }
  }
}
