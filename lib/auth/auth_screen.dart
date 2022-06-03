import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/constants/color_constants.dart';
import 'package:pomodoro_app/constants/text_constants.dart';
import 'package:pomodoro_app/home_page.dart';
import 'package:provider/provider.dart';
import '../services/auth.dart';
import 'auth_card.dart';

enum AuthMode{ SignUp, Login}

class AuthScreen extends StatefulWidget {

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

    User? user;


  Future<void> _signInGoogle()async{
    try{
     Provider.of<Auth>(context,listen: false).signInwithGoogle();
     if(user!.uid != null){
       Navigator.pushReplacement(context, MaterialPageRoute(
           builder: (context)=>HomePage()));
     }
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    final deviceSize=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            deviceSize.height*0.16),
        child: Container(
          decoration: BoxDecoration(
            color: ColorConstants.primaryColor,
            boxShadow: [
              BoxShadow(
                  blurRadius: 40.0)],
            borderRadius:BorderRadius.vertical(
                bottom: Radius.elliptical(
                    deviceSize.width, 100.0)),
          ),
        ),
      ),
      body:Center(
        child: Column(
          children:[
            Padding(
              padding: EdgeInsets.only(
                  top: 30.0),
              child: AuthCard(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 20),
              child: Row(
                  children: const <Widget>[
                    Expanded(
                        child: Divider(
                          thickness: 2,
                          indent: 50,
                          endIndent: 10,
                        )
                    ),
                    Text(TextConstants.or),
                    Expanded(
                        child: Divider(
                          indent: 10,
                          endIndent: 50,
                          thickness: 2,
                        )
                    ),
                  ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: 10),
                      child: Image.asset('assets/google.png',
                        width: 30,height: 30),
                    ),
                    Spacer(flex:1),
                    Text(TextConstants.continueGoogle,
                      style: TextStyle(
                      color: Theme.of(context).primaryColor
                    ),),
                  ],
                ),
                onPressed: (){
                  (user != null)
                      ? CircularProgressIndicator()
                      : _signInGoogle();
                },
                style: ButtonStyle(
                    fixedSize:MaterialStateProperty.all(
                        Size(
                            deviceSize.width*0.5,
                            deviceSize.height*0.05)) ,
                    shape:MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                      return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10));
                    }),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).backgroundColor)),),
            ),
          ],
        ),
      )
    );
  }
}
