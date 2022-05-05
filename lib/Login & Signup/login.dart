import 'package:cineverse/Firebase/FirebaseAuth.dart';
import 'package:cineverse/Dashboard/Home.dart';
import 'package:cineverse/Models/UserModel.dart';
import 'package:cineverse/ParentWidget.dart';
import 'package:cineverse/Utils/Colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Material(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 80.0),
              child: IntlPhoneField(
                onChanged: (phone) {
                  print(phone.number);
                },
                onCountryChanged: (country) {
                  print(country.dialCode);
                },
                initialCountryCode: 'IN',
                flagsButtonMargin: const EdgeInsets.only(left: 10.0),
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins",
                    color: Color.fromARGB(255, 88, 88, 88)),
                showDropdownIcon: false,
                showCountryFlag: false,
                decoration: const InputDecoration(
                    hintText: "Enter your phone",
                    fillColor: textFormFieldBackgroundColor,
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              )),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "or",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: .0,
          ),
          const Text(
            "connect with",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 13,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: GestureDetector(
              onTap: () {
                signInWithGoogle();
              },
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                    color: textFormFieldBackgroundColor,
                    borderRadius: BorderRadius.circular(4.0)),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Image.network(
                      "https://img.icons8.com/color/48/000000/google-logo.png",
                      scale: 1.5,
                    ),
                  ),
                  const Text("GOOGLE",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          color: Color.fromARGB(255, 114, 114, 114)))
                ]),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: textFormFieldBackgroundColor,
              ),
              height: 60.0,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Image.network(
                      "https://img.icons8.com/fluency/48/000000/facebook-new.png",
                      scale: 1.5,
                    ),
                  ),
                  const Text(
                    "FACEBOOK",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 114, 114, 114)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: GestureDetector(
              onTap: () => {verifying()},
              child: Container(
                decoration: BoxDecoration(
                    color: redColor, borderRadius: BorderRadius.circular(4.0)),
                margin: const EdgeInsets.only(top: 50),
                height: 55.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18.0,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 38.0),
                      child: Text(
                        ">",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18.0,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  verifying() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+6505551212",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException exception) {
        if (exception.code == 'invalid-phone-number') {
          print("Entered phone number is not valid. ");
        }
      },
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void signInWithGoogle() async {
    FirebaseService firebaseService = FirebaseService();
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firebaseService.signInWithGoogle();

    User? user = FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel(
      user: user!.displayName.toString(),
      email: user.email.toString(),
      emailVerified: user.emailVerified,
      phoneNumber: user.phoneNumber,
    );

    Future<DocumentSnapshot> doc =
        firestore.collection("users").doc(user.uid).get();
    print(doc);

    if (user != null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const ParentWidget())));
    } else {
      // ignore: avoid_print
      print("Some error occured.");
    }
  }
}
