import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                style: TextStyle(fontSize:24,),
                decoration: InputDecoration(
                    icon:Icon(Icons.pending_actions_sharp)),
              ),
            ),
            Container(

            ),
            Container(),
            Container(),
          ],
        ),
      ),

    );
  }
}
