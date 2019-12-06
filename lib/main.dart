import 'package:flutter/material.dart';
import 'layouts/home_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Half-Life: Alyx countdown',
        home: Home(),
      );
}
