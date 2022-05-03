import 'package:cineverse/Models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);

      print("Google SignIn complete");
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
    return null;
  }

  GoogleSignOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<UserModel?> getUserDetails() async {
    User? user = FirebaseAuth.instance.currentUser;
    print("Inside FirebaseAuth");
    if (user != null) {
      UserModel userModel = UserModel(
        user: user.displayName.toString(),
        email: user.email.toString(),
        emailVerified: user.emailVerified,
        phoneNumber: user.phoneNumber,
      );

      DocumentSnapshot snap = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get()
          // ignore: avoid_print
          .catchError((error) => print("Found this error ${error.toString()}"));

      if (snap.data() == null) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .set(userModel.toJson());
      }
      return UserModel.fromsnap(snap);
    }
  }
}
