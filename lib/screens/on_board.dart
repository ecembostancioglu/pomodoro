import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/check_internet.dart';
import 'package:pomodoro_app/screens/dashboard.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {

    final _auth=Provider.of<Auth>(context,listen: false);

    return StreamBuilder<User?>(
        stream: _auth.authStatus(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.active){
            return snapshot.data != null ? Dashboard() : CheckInternet();
          }else{
            return SizedBox(
              height: 300,
              width: 300,
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
