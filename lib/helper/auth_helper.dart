import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  AuthHelper._();

  static final AuthHelper authHelper = AuthHelper._();

  GoogleSignIn google = GoogleSignIn(
    scopes: ['email'],
  );

  signInAnonymously() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
      log("${userCredential.user!.uid}");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }

  createUserWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      log("${credential}");
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signInWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<GoogleSignInAccount> googleSignIn() async {
    GoogleSignInAccount? googleSignInAccount = await google.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    FirebaseAuth.instance.signInWithCredential(authCredential);

    return googleSignInAccount;
  }

  singOut() async {
    await FirebaseAuth.instance.signOut();
    google.signOut();
  }
}
