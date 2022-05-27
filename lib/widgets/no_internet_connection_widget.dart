import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/color_constants.dart';
import '../constants/text_constants.dart';

class NoInternetConnectionWidget extends StatelessWidget {
   NoInternetConnectionWidget({Key? key, required this.function}) : super(key: key);
   Future<void> function;

  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorConstants.grey,
      body: Container(
        child: AlertDialog(
          title: Image.asset('assets/no_internet.png',
              height:size.height*0.25),
          elevation: 5,
          content: Text(TextConstants.noConnection,
              textAlign: TextAlign.center,
              style:Theme.of(context).textTheme.subtitle1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)),
          actions: [
            Divider(
                thickness:0.3),
            CupertinoDialogAction(
                child: TextButton(
                    onPressed: ()=> function,
                    child: Text(TextConstants.retry,
                        style: Theme.of(context).textTheme.headline6)))
          ],
        ),
      ),

    );
  }
}
