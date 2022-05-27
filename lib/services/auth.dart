import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final _firebaseAuth=FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?>createUserWithEmailandPassword(
      String email,String password) async{
   try{
      final userCredentials = await _firebaseAuth
          .createUserWithEmailAndPassword(
          email: email,
          password: password);
      return userCredentials.user;
    }catch(error){
     return Future.error(error);
   }
  }

  Future<User?>loginWithEmailandPassword(
      String email,String password) async{
  try{
      final users = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password);
      return users.user;
    }catch(error){
    return Future.error(error);
  }
  }


  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

  Stream<User?> authStatus(){
    return _firebaseAuth.authStateChanges();
  }

  Future<void> signInwithGoogle() async {

    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async{
    await _googleSignIn.signOut();
  }




}