import 'package:flutter/material.dart';
import 'package:pomodoro_app/constants/color_constants.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
                child:Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                     clipBehavior: Clip.none,
                    children : [
                      Container(
                        width: size.width*0.5,
                        decoration:const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: ColorConstants.grey,
                              blurRadius: 2.0,
                              offset: Offset(2, 2)
                            )
                          ],
                            color: ColorConstants.primaryColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(20))
                        ),

                      ),
                      Positioned(
                          bottom: 80,
                          right: -75,
                          child:Image.asset('assets/clock.png',
                            height: 150,
                            width: 150,
                          ))
                    ],
                  ),
                ),),
            Expanded(
              flex: 1,
              child:Container(
                width:size.width*0.5,
              ),)
          ],
        ),
      ),
    );
  }
}
