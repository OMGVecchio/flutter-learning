import 'package:flutter/material.dart';

class SelfBottomNav extends StatelessWidget {
  final int index;
  SelfBottomNav({ @required this.index }) : super();
  @override
  Widget build(BuildContext ctx) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int index) {
        switch (index) {
          case 1:
            Navigator.pushReplacementNamed(ctx, '/test');
            break;
          default:
            Navigator.pushReplacementNamed(ctx, '/');
        }
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.mail),
          title: new Text('Article'),
        ),
      ],
    );
  }
}
