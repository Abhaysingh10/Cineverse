import 'package:cineverse/Firebase/FirebaseAuth.dart';
import 'package:cineverse/Models/UserModel.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late UserModel userModel;
  FirebaseService firebaseService = FirebaseService();
  UserModel get getUserModel => userModel;

  Future<void> refershUser() async {
    UserModel? user = await firebaseService.getUserDetails();
    userModel = user!;
    notifyListeners();
  }
}
