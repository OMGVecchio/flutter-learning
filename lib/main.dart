import 'package:flutter/material.dart';

import 'pages/english-word.dart';
import 'pages/images.dart';
import 'pages/article.dart';

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
        '/images': (BuildContext ctx) => new ImagesPage(),
        '/article': (BuildContext ctx) => new ArticlePage(),
      },
    );
  }
}
