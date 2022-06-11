import 'package:flutter/material.dart';
import 'package:pomodoro_app/home_page.dart';
import 'constants/color_constants.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
     theme:ThemeData(
        backgroundColor: ColorConstants.backgroundColor,
        primaryColor: ColorConstants.primaryColor,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily:'DidotRegular',
          bodyColor: ColorConstants.primaryColor,
        )),
     debugShowCheckedModeBanner: false,
     home: HomePage(),
      );
  }
}