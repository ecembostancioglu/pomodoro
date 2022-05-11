import 'package:flutter/material.dart';
import 'package:pomodoro_app/constants/color_constants.dart';
import 'package:pomodoro_app/constants/text_constants.dart';
import 'package:provider/provider.dart';
import '../services/auth.dart';
import 'auth_card.dart';

enum AuthMode{ SignUp, Login}

class AuthScreen extends StatefulWidget {

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  Future<void> _signInGoogle()async{
    try{
     Provider.of<Auth>(context,listen: false).signInwithGoogle();
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
              padding: EdgeInsets.only(top: 30.0),
              child: AuthCard(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                 splashColor: ColorConstants.highlightColor,
                 onTap: (){},
                 customBorder: CircleBorder(),
                 radius:deviceSize.width*0.1,
                 child: Icon(Icons.facebook,
                  size: deviceSize.width*0.14,
                  color: ColorConstants.facebook,),
             ),
                InkWell(
                  splashColor: ColorConstants.highlightColor,
                  radius:deviceSize.width*0.1,
                  onTap:_signInGoogle,
                  customBorder: CircleBorder(),
                  child: Image.asset('assets/google.png',
                    width:deviceSize.width*0.13),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}

