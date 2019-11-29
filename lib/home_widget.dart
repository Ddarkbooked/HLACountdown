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
                activeIcon: Image.asset('assets/images/newspaper.png',
                    width: 40, height: 40),
                icon: Image.asset('assets/images/newspaper.png',
                    width: 34, height: 34),
                title: Text(
                  'News',
                )),
            BottomNavigationBarItem(
                activeIcon: Image.asset('assets/images/megaphone.png',
                    width: 40, height: 40),
                icon: Image.asset('assets/images/megaphone.png',
                    width: 34, height: 34),
                title: Text('Timer'))
          ],
        ),
      );

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
