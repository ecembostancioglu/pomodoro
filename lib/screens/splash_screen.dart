import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/auth/auth_screen.dart';
import 'package:pomodoro_app/constants/color_constants.dart';
import 'package:pomodoro_app/constants/text_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

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

  Future<void> _checkConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.wifi) {
      print('Connected to a Wi-Fi network');
    } else if (result == ConnectivityResult.mobile) {
      print('Connected to a mobile network');
    } else {
      print('Not connected to any network');
    }

    setState(() {
      _connectivityResult = result;
    });
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
    return _connectivityResult==null || _isConnectionSuccessful==null
        ? NoInternetPopUp()
        : AuthScreen();


  }

  Widget NoInternetPopUp() {

    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.grey,
      body: Container(
        child: AlertDialog(
          title: Image.asset('assets/no_internet.png',
              height:size.height*0.25),
          elevation: 5,
          content: Text(TextConstants.noConnection,
              textAlign: TextAlign.center,
              style:Theme.of(context).textTheme.subtitle1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)),
          actions: [
            Divider(
                thickness:0.3),
            CupertinoDialogAction(
                child: TextButton(
                    onPressed:_tryConnection,
                    child: Text(TextConstants.retry,
                        style: Theme.of(context).textTheme.headline6)))
          ],
        ),
      ),

    );
  }
}


