import 'package:flutter/material.dart';
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
      resizeToAvoidBottomInset: false,
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
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Expanded(
               child: GridView.count(
                 crossAxisCount: 2,
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       width: size.width*0.8,
                       height: size.height*0.06,
                       decoration: BoxDecoration(
                         color: Colors.purple,
                         borderRadius: BorderRadius.circular(20),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       width: size.width*0.8,
                       height: size.height*0.06,
                       decoration: BoxDecoration(
                         color: Colors.green,
                         borderRadius: BorderRadius.circular(20),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       width: size.width*0.8,
                       height: size.height*0.06,
                       decoration: BoxDecoration(
                         color: Colors.orange,
                         borderRadius: BorderRadius.circular(20),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       width: size.width*0.8,
                       height: size.height*0.06,
                       decoration: BoxDecoration(
                         color: Colors.deepPurpleAccent,
                         borderRadius: BorderRadius.circular(20),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       width: size.width*0.8,
                       height: size.height*0.06,
                       decoration: BoxDecoration(
                         color: Colors.pink,
                         borderRadius: BorderRadius.circular(20),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       width: size.width*0.8,
                       height: size.height*0.06,
                       decoration: BoxDecoration(
                         color: Colors.limeAccent,
                         borderRadius: BorderRadius.circular(20),
                       ),
                     ),
                   ),

                 ],
               ),
             )
          ],
        ),

    );

  }
}
