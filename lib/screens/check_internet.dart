import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/auth/auth_screen.dart';
import '../widgets/no_internet_connection_widget.dart';

class CheckInternet extends StatefulWidget {
  const CheckInternet({Key? key}) : super(key: key);

  @override
  State<CheckInternet> createState() => _CheckInternetState();
}

class _CheckInternetState extends State<CheckInternet> {

  ConnectivityResult? _connectivityResult;
  StreamSubscription? _connectivitySubscription;
  bool? _isConnectionSuccessful;

  @override
  initState() {
    super.initState();
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
        ConnectivityResult result
        ) {
      print('Current connectivity status: $result');
      setState(() {
        _connectivityResult = result;
      });
    });
  }

  @override
  dispose() {
    super.dispose();

    _connectivitySubscription!.cancel();
  }

  Future<void> _tryConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');
      setState(() {
        _isConnectionSuccessful = response.isNotEmpty;
      });
    } on SocketException catch (e) {
      print(e);
      setState(() {
        _isConnectionSuccessful = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _connectivityResult==null
        ? NoInternetConnectionWidget(
        function: _tryConnection())
        : AuthScreen();
  }
}


