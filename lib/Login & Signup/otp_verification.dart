import 'package:cineverse/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({Key? key}) : super(key: key);

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: const Text(
          "OTP Verification",
          style: TextStyle(fontFamily: "Poppins", color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          const Center(
            child: Text(
              "We have sent a verification code to",
              style: TextStyle(fontFamily: "Poppins"),
            ),
          ),
          const Center(child: Text("+91 9169140735")),
          const SizedBox(height: 20.0),
          const Pinput(length: 5),
          const SizedBox(height: 25.0),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                      color: const Color.fromARGB(255, 178, 178, 178))),
              height: 50.0,
              width: MediaQuery.of(context).size.width * .5,
              child: const Center(
                  child: Text(
                "Resesnd SMS in 20 sec",
                style: TextStyle(fontFamily: "Poppins"),
              ))),
        ],
      ),
    );
  }
}
