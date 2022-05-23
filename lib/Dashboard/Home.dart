import 'dart:convert';
import 'dart:ffi';

import 'package:cineverse/Firebase/FirebaseAuth.dart';
import 'package:cineverse/Login%20&%20Signup/login.dart';
import 'package:cineverse/Models/MoviesModel.dart';
import 'package:cineverse/Models/UserModel.dart' as model;
import 'package:cineverse/Providers/UserProvider.dart';
import 'package:cineverse/Utils/Colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream<MoviesModel> futureMoviesModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // futureMoviesModel = getAllData() as Stream<MoviesModel>;
  }

  // Future<MoviesModel> getAllData() async {
  //   Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot =
  //       FirebaseFirestore.instance.collection("scifi").snapshots();

  // //querySnapshot.map((event) => event.docs.map((e) => MoviesModel(description: e.data['description'], ))

  //  // return MoviesModel.;
  // }

  @override
  Widget build(BuildContext context) {
    model.UserModel userInfo =
        Provider.of<UserProvider>(context, listen: false).getUserModel;

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(45, 158, 158, 158),
                      border: Border.all(
                          color: const Color.fromARGB(255, 83, 83, 83)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search movies",
                          hintStyle: TextStyle(fontFamily: "Poppins"),
                          suffixIcon: Icon(Icons.search)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              Row(
                children: const [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.0),
                    child: Text(
                      "Trending",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Image(
                    image: AssetImage("assets/images/Vector.png"),
                  )
                ],
              ),
              StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("scifi").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                      child: Container(
                        color: backgroundColor,
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: 500,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: snapshot.data!.docs.map((e) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 5.0),
                              child: Container(
                                width: 95,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 95,
                                      height: 95,
                                      decoration: BoxDecoration(
                                          // color: Colors.red,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${e.get('poster')}"),
                                              fit: BoxFit.fitWidth),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                              color:
                                                  Color.fromARGB(0, 0, 0, 0))),
                                    ),
                                    Text(
                                      e.get('movieName'),
                                      style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "For you",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          genre("All"),
                          const SizedBox(
                            width: 15.0,
                          ),
                          genre("Action"),
                          const SizedBox(
                            width: 15.0,
                          ),
                          genre("Romantic"),
                          const SizedBox(
                            width: 15.0,
                          ),
                          genre("Thriller"),
                          const SizedBox(
                            width: 15.0,
                          ),
                          genre("Comedy")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
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

  genre(String value) {
    return (Container(
      padding: EdgeInsets.all(10.0),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
      height: 40,
      child: Text(
        value.toString(),
        style: const TextStyle(
            color: Color.fromARGB(230, 253, 4, 70),
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color.fromARGB(44, 242, 5, 68)),
    ));
  }
}
