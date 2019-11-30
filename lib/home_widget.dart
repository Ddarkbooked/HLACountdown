import 'placeholder_widget.dart';
import 'package:flutter/material.dart';

import 'timer_widget.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.greenAccent),
    TimerWidget()
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.web_asset),
              title: Text('News'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              title: Text('Timer'),
            )
          ],
        ),
      );

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
