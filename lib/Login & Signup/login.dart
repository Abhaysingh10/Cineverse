import 'package:cineverse/Utils/Colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: textFormFieldBackgroundColor),
                        borderRadius: BorderRadius.circular(4.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: textFormFieldBackgroundColor),
                        borderRadius: BorderRadius.circular(4.0)),
                    filled: true,
                    fillColor: textFormFieldBackgroundColor,
                    hintText: "Enter your phone",
                    hintStyle: const TextStyle(fontFamily: "Poppins"))),
          ),
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
        ],
      )),
    );
  }
}
