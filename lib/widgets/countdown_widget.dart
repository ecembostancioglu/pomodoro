import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({Key? key}) : super(key: key);

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> with TickerProviderStateMixin{
  late AnimationController controller;
  bool isPlaying=false;
  double progress=1.0;
  //late int _longBreak;
  //int _shortBreak=5;

  String get countText{
    Duration count=controller.duration! * controller.value;
    return '${(count.inMinutes % 60).toString().padLeft(2,'0')}'
        ':${(count.inSeconds % 60).toString().padLeft(2,'0')}';
  }

  @override
  void initState() {
    super.initState();
    controller =AnimationController(
        vsync: this,duration:
    Duration(seconds: 1500));
    controller.addListener(() {
      if(controller.isAnimating){
        setState(() {
          progress=controller.value;
        });
      }else{
        setState(() {
          progress=1.0;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return Column(
        children: [
          Center(
            child: Stack(
              alignment:Alignment.center,
              children:[
                SizedBox(
                    width:size.width*0.5,
                    height: size.height*0.3,
                    child: CircularProgressIndicator(
                      value: progress,
                      backgroundColor: ColorConstants.highlightColor,
                      color: Theme.of(context).primaryColor,
                      strokeWidth: 8,
                    )),
                AnimatedBuilder(
                 animation: controller,
                 builder: (context,child)=> Text(
                 countText,
                 style: Theme.of(context).textTheme.headline2,
                  ),
               ),]
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 60,bottom: 10),
              child: Text('STEPPER')),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                heroTag: 'playButton',
                onPressed:(){
                  if(controller.isAnimating){
                    controller.stop();
                  setState(() {
                    isPlaying=false;
                  });
                  }else{
                    controller.reverse(from: controller.value == 0
                        ? 1.0 : controller.value);
                    setState(() {
                      isPlaying=true;
                    });
                  }
                },
                child:isPlaying ==true
                    ? Icon(Icons.pause)
                    :Icon(Icons.play_arrow),
                ),
                FloatingActionButton(
                heroTag: 'pauseButton',
                backgroundColor:ColorConstants.error,
                onPressed:(){
                  controller.reset();
                  setState(() {
                    isPlaying=false;
                  });
                },
                child: Icon(Icons.stop),
                ),
              ],
            ),
          ),
        ],
      );
  }
}
