
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../routes/screens_route_name.dart';
import '../services/snack_bar_service.dart';

abstract class FirebaseServices {
  static Future<bool> signUp(String emailAddress, String password) async {
    EasyLoading.show();
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);
      SnackBarService.showSuccessMessage("Successfully Registration");
      return Future.value(true);
    } on FirebaseAuthException catch (firebaseAuthException) {
      if (firebaseAuthException.code == 'invalid-credential') {
        SnackBarService.showErrorMessage(
            firebaseAuthException.message ?? "Password is too weak");

        print('The password provided is too weak.');
      } else if (firebaseAuthException.code == 'invalid-credential') {
        SnackBarService.showErrorMessage(
            firebaseAuthException.message ?? "Password is too weak");
        print('The account already exists for that email.');
      }
      return Future.value(false);
    } catch (error) {
      print(error.toString());
      return Future.value(false);
    }
  }

 
    

  static Future<bool> signIn(String emailAddress, String password) async {
    EasyLoading.show();
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      SnackBarService.showSuccessMessage("Logged in Successfully");
      return Future.value(true);
    } on FirebaseAuthException catch (firebaseAuthException) {
      print(firebaseAuthException.code);
      if (firebaseAuthException.code == 'invalid-credential') {
        SnackBarService.showErrorMessage(
            firebaseAuthException.message ?? "No user found for that email");
      } else if (firebaseAuthException.code == 'invalid-credential') {
        SnackBarService.showErrorMessage(
            firebaseAuthException.message ?? "No user found for that email");
      }
      return Future.value(false);
    } catch (error) {
      print(error.toString());
      return Future.value(false);
    }
  }




 static Future<void> loginWithGoogle(BuildContext context) async {
  try {
    EasyLoading.show();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    var userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user!.uid.toString());

    // Navigate to the profile screen after successful sign-in
    Navigator.pushNamedAndRemoveUntil(
      context,
      ScreenRouteName.profileView,
      (route) => false,
    );
  } catch (e) {
    print("Error during Google Sign-In: $e");
    EasyLoading.showError("Failed to sign in with Google");
  } finally {
    EasyLoading.dismiss();
  }
}
}
