import 'package:cineverse/Firebase/FirebaseAuth.dart';
import 'package:cineverse/Models/UserModel.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _userModel;
  FirebaseService firebaseService = FirebaseService();
  UserModel get getUserModel => _userModel!;

  Future<void> refershUser() async {
    UserModel? user = await firebaseService.getUserDetails();
    _userModel = user!;

    print(_userModel?.email);

    notifyListeners();
  }
}
