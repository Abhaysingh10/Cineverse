import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late final String user;
  late final String email;
  late final emailVerified;
  late final phoneNumber;
  late final photoUrl;

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
