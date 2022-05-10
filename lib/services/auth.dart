import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';

class Auth with ChangeNotifier{

  Future<void> _authenticate(String email, String password)async{
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
      return Future.error(HttpException(responseData['error']['message']));
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
  }

}