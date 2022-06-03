import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth with ChangeNotifier{
  final _firebaseAuth=FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?>createUserWithEmailandPassword(
      String email,String password) async{
   try{
      final userCredentials = await _firebaseAuth
          .createUserWithEmailAndPassword(
          email: email,
          password: password);
       notifyListeners();
      String userUid=userCredentials.user!.uid;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userUid)
          .set({'email':email});
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
      notifyListeners();
      return users.user;
    }catch(error){
    return Future.error(error);
  }
  }


  Future<void> addUsertoFirestore(User currentUser)async{
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser.uid)
        .set({'email':currentUser.email});
  }




  Future<void> signOut() async{
    await _firebaseAuth.signOut();
    notifyListeners();
  }

  Stream<User?> authStatus(){
    return _firebaseAuth.authStateChanges();
  }

  Future<void> signInwithGoogle() async {

    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication!.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      String userUid=googleSignInAccount.id;
      String userMail=googleSignInAccount.email;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userUid)
          .set({'email':userMail});
      await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      rethrow;
    }
    notifyListeners();
  }

  Future<void> signOutFromGoogle() async{
    await _googleSignIn.signOut();
    notifyListeners();
  }




}