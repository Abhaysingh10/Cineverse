import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String user;
  final String email;
  final emailVerified;
  final phoneNumber;
  final photoUrl;

  UserModel(
      {required this.user,
      required this.email,
      required this.emailVerified,
      required this.phoneNumber,
      this.photoUrl});

  Map<String, dynamic> toJson() => {
        "user": user,
        "email": email,
        "photoUrl": photoUrl,
        "phoneNumber": phoneNumber
      };

  static UserModel fromsnap(DocumentSnapshot snap) {
    var snapshot = (snap.data() as Map<String, dynamic>);
    return UserModel(
      user: snapshot['user'],
      phoneNumber: snapshot['phoneNumber'],
      email: snapshot['email'],
      photoUrl: snapshot['photoUrl'],
      emailVerified: snapshot["snapshot"],
    );
  }
}
