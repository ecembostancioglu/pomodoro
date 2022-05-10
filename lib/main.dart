import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:pomodoro_app/constants/color_constants.dart';
import 'package:pomodoro_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
        home: SplashScreen(),
      ),
    );
  }
}
