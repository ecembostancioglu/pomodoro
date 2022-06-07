import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/auth/auth_screen.dart';
import 'package:pomodoro_app/screens/home/dashboard/add_task.dart';
import 'package:pomodoro_app/services/auth.dart';
import 'package:pomodoro_app/widgets/countdown_widget.dart';
import 'package:provider/provider.dart';

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

    void _addNewTask(){
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>AddTask()));
    }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _addNewTask,
              icon: Icon(Icons.add,
                color: Colors.white,size: 32,))
        ],
        leading: InkWell(
            onTap: _signOut,
            child: const Icon(Icons.logout)),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('Task',
             style: TextStyle(fontSize: 36),),
            ),
            Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blueAccent)
              ),
                child: Text('Learn Bloc',style: Theme.of(context).textTheme.headline5)),
            Padding(
            padding: const EdgeInsets.only(top: 10.0),
             child:CountdownWidget(),
            )],
        ),
      ),

    );

  }
}
