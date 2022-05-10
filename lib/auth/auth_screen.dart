import 'package:flutter/material.dart';
import 'package:pomodoro_app/constants/color_constants.dart';
import 'auth_card.dart';

enum AuthMode{ SignUp, Login}

class AuthScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final deviceSize=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            deviceSize.height*0.18),
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
                    Text("OR"),
                    Expanded(
                        child: Divider(
                          indent: 10,
                          endIndent: 50,
                          thickness: 2,
                        )
                    ),
                  ]
              )
            )
          ],
        ),
      )
    );
  }
}

