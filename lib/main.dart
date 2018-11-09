import 'package:flutter/material.dart';

import 'pages/english-word.dart';
import 'pages/route-test.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.pink,
      ),
      home: new EWLPage(),
      routes: <String, WidgetBuilder> {
        '/test': (BuildContext ctx) => new RouteTest(),
      },
    );
  }
}
