import 'dart:math';

import 'package:fl_hla_timer/awesome_icons.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatefulWidget {
  @override
  _NewsItemState createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  bool _likeBtnPressed = false;
  int _likesCount = Random().nextInt(50);

  Icon iconFlow() {
    if (_likeBtnPressed) {
      _likesCount++;
      return Icon(
        AwesomeIcons.heart,
        size: 22,
        color: Colors.redAccent,
      );
    } else {
      _likesCount--;
      return Icon(AwesomeIcons.heart, size: 22, color: Colors.grey[400]);
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
        height: 240,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: <Widget>[
            Container(
              height: 176,
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://cdn.vox-cdn.com/thumbor/AQi5B58McHQHZNW7qgxhTukMNic=/0x0:1020x677/1200x675/filters:focal(429x257:591x419)/cdn.vox-cdn.com/uploads/chorus_image/image/61162037/z203-05_1009vs.0.1410292058.0.jpg')),
                  border: Border.all(color: Colors.grey[100], width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Align(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16, color: Colors.black.withOpacity(0.9)),
                    ),
                  ),
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18))),
                ),
                alignment: Alignment.bottomCenter,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          _likeBtnPressed = !_likeBtnPressed;
                        });
                      },
                      child: iconFlow(),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      '$_likesCount',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.chat,
                      size: 22,
                      color: Colors.grey[400],
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      '8',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
