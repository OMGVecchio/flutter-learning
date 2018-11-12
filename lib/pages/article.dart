import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../common/bottomNav.dart';

final dio = Dio();

class ArticlePage extends StatelessWidget {  
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vecchio\'s Blog'),
      ),
      body:  Center(
        child: FutureBuilder(
          future: dio.get('https://vecchio.top/api/article'),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            final articleList = <Widget>[];
            if (snapshot.hasData) {
              final data = snapshot.data.data['data'];
              for(int i = 0, l = data.length; i < l; i++) {
                Widget item = Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.album),
                        title: Text(data[i]['title']),
                        // subtitle: new Markdown(data: data[i]['article'].toString()),
                        subtitle: Text(data[i]['article'].toString()),
                      ),
                    ],
                  )
                );
                articleList.add(item);
              }
              return ListView(
                children: articleList,
              );
            }
            if (snapshot.hasError) {
              
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      bottomNavigationBar: SelfBottomNav(
        index: 2,
      ),
    );
  }
}

// class ArticleList extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => ArticleState();
// }

// class ArticleState extends State<ArticleList> {
//   final articles = <Widget>[];
//   @override
//   Widget build(BuildContext ctx) {
//     return ListView(
//       children: articles,
//     );
//   }
// }
