import 'package:flutter/material.dart';
import 'package:messengerapp/ui/messengerhome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MessengerAPP',
      debugShowCheckedModeBanner: false,
      home: MessengerHome(),
    );
  }
}