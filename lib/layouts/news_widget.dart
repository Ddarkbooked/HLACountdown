import 'package:flutter/material.dart';

class NewsWidget extends StatefulWidget {
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  bool _likeBtnPressed = false;

  @override
  Widget build(BuildContext context) => Material(
          child: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(14),
            height: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: <Widget>[
                Container(
                  height: 230,
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300], width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Align(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.black12,
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
                          child: likeFlow(),
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          '23000',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.chat,
                          size: 24,
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
          ),
        ],
      ));

  Image likeFlow() {
    if (_likeBtnPressed) {
      return Image.asset('assets/images/like_red.png', height: 23, width: 23);
    } else
      return Image.asset('assets/images/like.png',
          height: 23, width: 23, color: Colors.grey[400]);
  }
}
