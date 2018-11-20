import 'package:flutter/material.dart';

import '../common/bottomNav.dart';

class ImagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('多测试下 Scaffold 各个属性'),
      ),
      body: ListView(
        children: <Widget>[
          Image.network('https://rms.zhubajie.com/resource/redirect?key=mobile%2Fdefault%2F%E5%A4%B4%E5%83%8F17.jpg%2Forigine%2F1990662d-d67a-4f85-92bf-73be1dd6d334&s.w=240&s.h=240'),
          Image.asset('assets/cat.gif'),
          Image.asset('assets/octocat.png'),
        ],
      ),
      bottomNavigationBar: SelfBottomNav(
        index: 1,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
              ),
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('test1'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.cast),
              title: Text('test2'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
