import 'package:flutter/material.dart';
import 'package:pomodoro_app/home_page.dart';
import 'package:pomodoro_app/screens/home/dashboard/dashboard.dart';
import 'package:pomodoro_app/screens/onboard/on_board.dart';
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

    return ChangeNotifierProvider(
        create: (context)=> Auth(),
        child: MaterialApp(
         theme:ThemeData(
            backgroundColor: ColorConstants.backgroundColor,
            primaryColor: ColorConstants.primaryColor,
            textTheme: Theme.of(context).textTheme.apply(
              fontFamily:'DidotRegular',
              bodyColor: ColorConstants.primaryColor,
            )),
         debugShowCheckedModeBanner: false,
         home: HomePage(),
      ),
    );
  }
}