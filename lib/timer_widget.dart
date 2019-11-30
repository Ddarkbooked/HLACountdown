import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  String v;

  final startTime = DateTime.now();
  final endTime = DateTime(2020, 3, 30);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Timer'),
          ),
          body: RopSayac(),
        ),
      );
}

class RopSayac extends StatefulWidget {
  _RopSayacState createState() => _RopSayacState();
}

class _RopSayacState extends State<RopSayac> {
  String _now;

  @override
  void initState() {
    super.initState();

    // sets first value
    _now = DateTime.now().second.toString();

    // defines a timer
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now().second.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
            '${DateTime.now().day.toString()}:${DateTime.now().month.toString()}:${DateTime.now().year.toString()} \n ${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}:${DateTime.now().second.toString()}'),
      ),
    );
  }
}
