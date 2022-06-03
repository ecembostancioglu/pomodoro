import 'package:flutter/material.dart';
import 'package:pomodoro_app/auth/auth_screen.dart';
import 'package:provider/provider.dart';
import '../../services/auth.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

    Future<void> _signOut()async{
      try{
        Provider.of<Auth>(context,listen: false).signOutFromGoogle();
        Provider.of<Auth>(context,listen: false).signOut();
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context)=>AuthScreen()));
      }catch(e){
        print(e);
      }
    }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: _signOut,
            child: Icon(Icons.logout)),
      ),
    );

  }
}
