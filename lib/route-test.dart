import 'package:flutter/material.dart';

class RouteTest extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('测试下 pushNamed 跳转'),
      ),
      body: new ListView(
        children: <Widget>[
          new Image.network('https://rms.zhubajie.com/resource/redirect?key=mobile%2Fdefault%2F%E5%A4%B4%E5%83%8F17.jpg%2Forigine%2F1990662d-d67a-4f85-92bf-73be1dd6d334&s.w=240&s.h=240'),
          new Image.asset('assets/cat.gif'),
          new Image.asset('assets/octocat.png'),
        ],
      ),
    );
  }
}
