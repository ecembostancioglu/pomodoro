import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pomodoro_app/constants/text_constants.dart';
import 'package:pomodoro_app/screens/auth/auth_screen.dart';


class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => AuthScreen()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  Widget nextButton(){
    return ElevatedButton(
        onPressed: () => _onIntroEnd(context),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        child: const Text(TextConstants.done,
            style: TextStyle(fontWeight: FontWeight.w600)));
  }



  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
            child: TextButton(
              onPressed: ()=> _onIntroEnd(context),
              child: Text(TextConstants.skip,
              style: TextStyle(color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),),
            ),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: TextConstants.planYourTasks,
          body: TextConstants.planYourTasksBody,
          image: _buildImage('work.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: TextConstants.neverStress,
          body: TextConstants.neverStressBody,
          image: _buildImage('work2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: TextConstants.startToWork,
          body:TextConstants.startToWorkBody,
          image: _buildImage('work3.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      next: const Icon(Icons.arrow_forward),
      done: nextButton(),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
       // color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
