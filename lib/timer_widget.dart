import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: TimerCountdownWidget(),
        ),
      );
}

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

  @override
  void initState() {
    super.initState();

    // sets first value
    _now = DateTime.now().second.toString();

    // defines a timer
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now().second.toString();

        _countdownSec = 60 - DateTime.now().second + endTime.second;
        _countdownMin = 60 - DateTime.now().minute + endTime.minute;
        _countdownHour = 24 - DateTime.now().hour + endTime.hour;
        _countdownDay = 31 - DateTime.now().day;
        _countdownMonth = 12 - DateTime.now().month + endTime.month;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black, statusBarBrightness: Brightness.light));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 36),
              child: Container(
                height: 200,
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
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
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
      ),
    );
  }
}
