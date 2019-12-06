import 'dart:async';
import 'package:flutter/material.dart';

class TimerCountdownWidget extends StatefulWidget {
  _TimerCountdownWidgetState createState() => _TimerCountdownWidgetState();
}

class _TimerCountdownWidgetState extends State<TimerCountdownWidget> {
  var _now;

  final endTime = DateTime(2020, 3, 30, 24, 60, 60);

  int _countdownSec;
  int _countdownMin;
  int _countdownHour;
  int _countdownDay;
  int _countdownMonth;

  double _acHeight = 200;
  bool _stateHeight = true;

  void _calcTime() {
    _countdownSec = 60 - DateTime.now().second + endTime.second;
    _countdownMin = 60 - DateTime.now().minute + endTime.minute;
    _countdownHour = 24 - DateTime.now().hour + endTime.hour;
    _countdownDay = 31 - DateTime.now().day;
    _countdownMonth = 12 - DateTime.now().month + endTime.month;
  }

  @override
  void initState() {
    _calcTime();
    super.initState();

    // sets first value
    _now = DateTime.now().second.toString();

    // defines a timer
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now().second.toString();
        // _calcTime();
      });
    });
  }

  @override
  Widget build(BuildContext context) => Material(
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  if (_stateHeight) {
                    _acHeight = 100;
                    _stateHeight = !_stateHeight;
                  } else if (!_stateHeight) {
                    _acHeight = 200;
                    _stateHeight = true;
                  }
                });
              },
              child: AnimatedContainer(
                margin: const EdgeInsets.all(14),
                height: _acHeight,
                curve: Curves.easeInOutBack,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(247, 72, 67, 1), blurRadius: 5)
                    ],
                    image: DecorationImage(
                        image: AssetImage('assets/images/valve.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                alignment: Alignment.center,
                duration: Duration(milliseconds: 500),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(247, 72, 67, 1),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(247, 72, 67, 1), blurRadius: 5)
                  ]),
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '$_countdownMonth months \n$_countdownDay days \n$_countdownHour hours \n$_countdownMin minutes \n$_countdownSec seconds',
                  style: TextStyle(
                      fontSize: 50,
                      fontStyle: FontStyle.normal,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
}
