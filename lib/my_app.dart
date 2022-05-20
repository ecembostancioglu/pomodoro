import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/check_internet.dart';
import 'package:pomodoro_app/screens/dashboard.dart';
import 'package:pomodoro_app/screens/on_board.dart';
import 'package:pomodoro_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'constants/color_constants.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Auth(),
      child: MaterialApp(
        theme:ThemeData(
            backgroundColor: ColorConstants.backgroundColor,
            primaryColor: ColorConstants.primaryColor,
            textTheme: Theme.of(context).textTheme.apply(
              bodyColor: ColorConstants.primaryColor,
            )),
        debugShowCheckedModeBanner: false,
        home: OnBoard(),
      ),
    );
  }
}