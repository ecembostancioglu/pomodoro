import 'package:flutter/material.dart';
import 'package:pomodoro_app/constants/color_constants.dart';
import 'package:pomodoro_app/screens/home/dashboard/dashboard.dart';
import 'package:pomodoro_app/screens/home/tasks_page/tasks_page_view.dart';
import 'screens/home/profile_page/profile_page_view.dart';
import 'screens/home/statistic_page/statistic_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex=0;

  static const List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    TasksPage(),
    StatisticPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon:Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(
              icon:Icon(Icons.access_time),
              label: 'Tasks'),
          BottomNavigationBarItem(
              icon:Icon(Icons.bar_chart_rounded),
              label: 'Statistics'),
          BottomNavigationBarItem(
              icon:Icon(Icons.person_rounded),
              label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:ColorConstants.selectedItemColor,
        unselectedItemColor: ColorConstants.primaryColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
