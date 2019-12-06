import 'package:fl_hla_timer/widgets/news_item_widget.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatefulWidget {
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) => Material(
          child: ListView(
        children: <Widget>[NewsItem(), NewsItem(), NewsItem(), NewsItem(), NewsItem()],
      ));
}
