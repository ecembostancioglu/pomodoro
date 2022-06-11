import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/widgets/dropdown_button_widget.dart';

import '../../../constants/color_constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final List<String> items=[
    '1 min', '2 min', '3 min', '4 min', '5 min',
    '6 min', '7 min', '8 min', '9 min', '10 min',
    '11 min', '12 min', '13 min', '14 min', '15 min',
    '16 min', '17 min', '18 min', '19 min', '20 min',
    '21 min', '22 min', '23 min', '24 min', '25 min',
  ];
  final List<String> workingSessions=[
    '1 times', '2 times', '3 times', '4 times',

  ];

  String? selectedFocusTime;
  String? selectedShortBreak;
  String? selectedLongBreak;
  String? selectedWorkingSessions;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Settings',
                  style: Theme.of(context).textTheme.headline3,),
              ),
              DropdownWidget(
                  name: 'Focus Time',
                  hint: 'Select your time',
                  value:selectedFocusTime,
                  item: items),
              DropdownWidget(
                  name: 'Short Break',
                  hint: 'Select your time',
                  value:selectedShortBreak,
                  item: items),
              DropdownWidget(
                  name: 'Long Break',
                  hint: 'Select your time',
                  value:selectedLongBreak,
                  item: items),
              DropdownWidget(
                  name: 'Working Sessions',
                  hint: 'Select your sessions',
                  value:selectedWorkingSessions,
                  item: workingSessions),
            ],
          ),
        ),
      ),
    );
  }
}
