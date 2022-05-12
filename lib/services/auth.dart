import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';

class Auth with ChangeNotifier{

  String? _uid;
  String? _email;



  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _authenticatewithSignUp(String email, String password)async{
    final String url =FlutterConfig.get('API_URL_SIGNUP');
    try{
      final response=await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken':true
          },
        ),
      );
      final responseData=json.decode(response.body);
      if(responseData['error'] != null){
      throw HttpException(responseData['error']['message']);
      }
    } catch(error){
       return Future.error(error);
    }

  }
  Future<void> _authenticatewithLogin(String email, String password)async{
    final String url =FlutterConfig.get('API_URL_LOGIN');
    try{
      final response=await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken':true
          },
        ),
      );
      final responseData=json.decode(response.body);
      if(responseData['error'] != null){
        throw HttpException(responseData['error']['message']);
      }
    } catch(error){
      return Future.error(error);
    }

  }


  Future<void> signUp(String email, String password)async{

  final String url =FlutterConfig.get('API_URL_SIGNUP');
  final response=await http.post(
   Uri.parse(url),
   body: json.encode(
   {
    'email': email,
    'password': password,
    'returnSecureToken':true
   },
  ),
 );
 print(json.decode(response.body));
 return _authenticatewithSignUp(email, password);

  }

  Future<void> login(String email, String password)async{
    final String url =FlutterConfig.get('API_URL_LOGIN');
    final response=await http.post(
      Uri.parse(url),
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken':true
        },
      ),
    );
    print(json.decode(response.body));
    return _authenticatewithLogin(email, password);

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
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async{
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

}