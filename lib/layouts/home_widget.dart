import 'package:flutter/material.dart';
import 'news_widget.dart';
import 'timer_widget.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  PageController _pageController;

  final List<Widget> _children = [NewsWidget(), TimerCountdownWidget()];

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12),
          ),
        ),
        backgroundColor: Color.fromRGBO(247, 72, 67, 1),
        title: AnimatedCrossFade(
          crossFadeState: _currentIndex == 0
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 125),
          firstChild: Text('News'),
          secondChild: Text('Timer'),
        ),
        elevation: 5,
      ),
      body: PageView(
        children: _children,
        controller: _pageController,
        onPageChanged: (newPage) {
          setState(() {
            this._currentIndex = newPage;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Color.fromRGBO(247, 72, 67, 1),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.web_asset,
            ),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            title: Text('Timer'),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      this._pageController.animateToPage(index,
          curve: Curves.easeInOutCubic, duration: Duration(milliseconds: 450));
      _currentIndex = index;
    });
  }
}
