import 'dart:math';

import 'package:flutter/material.dart';

class MessengerDm extends StatefulWidget {
  @override
  _MessengerDmState createState() => _MessengerDmState();
}

class _MessengerDmState extends State<MessengerDm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF1D2427),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        title: Text('Christina',
            style: TextStyle(fontSize: 15, fontFamily: 'Montserrat')),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: Color(0xFF1D2427),
      body: new MessageTransfer(),
    );
  }
}

class MessageTransfer extends StatelessWidget {
  final TextEditingController _text = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
          child: Container(
        margin: EdgeInsets.only(top: 10),
//        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(children: <Widget>[
          Expanded(
            child: new ListView(
              reverse: true,
              padding: EdgeInsets.only(bottom: 10),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 3),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width /2,
//                  alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: Color(0xFFFDEBEA),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
//                              bottomRight: Radius.circular(25)
                          )
                      ),
                      child: Column(
                        children: <Widget>[
//                          Text(
//                            '11:58am',
//                            style: TextStyle(color: Colors.black54, fontSize: 13),
//                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'How are you?',
                              style: TextStyle(color: Colors.black54, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width /2,
//                  alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: Color(0xFFDFFFFF),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
//                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)
                          )
                      ),
                      child: Text(
                        'Hello',
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite),
                          color: Colors.redAccent,
                          iconSize: 26,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFDEBEA),
                    borderRadius: BorderRadiusDirectional.circular(20)
                  ),
                  padding: EdgeInsets.all(6),
                  margin: EdgeInsets.only(bottom: 15, right: 15, left: 15),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Theme(
                              data: Theme.of(context).copyWith(
                                  primaryColor: Colors.black54,
                                  inputDecorationTheme: new InputDecorationTheme(
                                    hoverColor: Colors.black54,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  )),
                              child: new TextField(
                                keyboardType: TextInputType.text,
                                controller: _text,
                                decoration: new InputDecoration(
                                  hintText: 'Send message',
                                  labelStyle: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Montserrat'),

                                ),
                              )),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xFF2D393E),
                        child: Transform.rotate(
                          angle: -1.6,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.send),
                            color: Colors.white,
                            iconSize: 23,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          )
        ]),
      )),
    ]);
  }
}

//TextField(
//keyboardType: TextInputType.text,
//controller: _text,
//decoration: new InputDecoration(
//labelText: 'Weight on earth',
//hintText: 'In Pounds',
//labelStyle: new TextStyle(
//color: Colors.white,
//fontSize: 18,
//fontFamily: 'Montserrat'),
//border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(width: 1,color: Colors.black54)),
//),
//),

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return new Rect.fromCircle(
        center: new Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
