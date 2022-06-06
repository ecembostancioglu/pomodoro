import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomodoro_app/constants/color_constants.dart';
import 'package:pomodoro_app/screens/auth/auth_screen.dart';
import 'package:pomodoro_app/screens/home/dashboard/add_task.dart';
import 'package:pomodoro_app/services/auth.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int _seconds=0;
  int _minutes=25;
  Timer? _timer;

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



    void _startTimer(){
     if(_timer != null){
       _timer!.cancel();
     }
     if(_seconds > 60){
       _minutes=(_seconds/60).floor();
     }

     _timer=Timer.periodic(Duration(seconds: 1), (timer) {
       setState(() {
         if(_seconds >0){
           _seconds--;
         }else{
           if(_minutes > 0){
             _seconds=59;
             _minutes--;
           }
           else{
             _timer!.cancel();
             print('timer complete');
             _seconds=0;
             _minutes=25;
           }

         }
       });
     });
    }
    void _stopTimer(){
       _timer!.cancel();
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
        child: Column(
          children: [
            Flexible(
                flex:1,
                child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Task',style: TextStyle(fontSize: 36),),
            )),
            Flexible(
                flex:1,
                child: Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blueAccent)
                  ),
                    child: Text('Learn Bloc',style: Theme.of(context).textTheme.headline5))),
            Flexible(
                flex:6,
                child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                 child:CircularPercentIndicator(

                  radius: 140.0,
                   lineWidth: 10,
                   percent:0.5,
                   animation: true,
                   circularStrokeCap: CircularStrokeCap.round,
                   center:Text('${_minutes}: ${_seconds}',
                       style: Theme.of(context).textTheme.headline2),
              )
            )),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(child: FloatingActionButton(
                    heroTag: 'playButton',
                    onPressed:_startTimer,
                    child: Icon(Icons.play_arrow),
                  ),),
                  Flexible(child: FloatingActionButton(
                    heroTag: 'pauseButton',
                    backgroundColor:ColorConstants.error,
                    onPressed: _stopTimer,
                    child: Icon(Icons.pause),
                  ),),
                ],
              ),
            )],
        ),
      ),

    );

  }
}
