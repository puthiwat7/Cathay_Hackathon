import 'package:cathay_flutter_2/home.dart';
import 'package:cathay_flutter_2/scroll.dart';
import 'package:cathay_flutter_2/travel.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData.light(),
      routes: {
        '/homepage':(context) => HomePage(),
        '/scrollpage':(context) => ScrollPage(),
        '/travelpage':(context) => TravelPage()
      }
    );
  }
}

