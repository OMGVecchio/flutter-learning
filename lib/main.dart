import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'route-test.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return new MaterialApp(
      title: 'flutter list',
      theme: new ThemeData(
        primaryColor: Colors.pink,
      ),
      home: new Scaffold(
        body: new Center(
          child: new RandomWords(),
        ),
      ),
      routes: <String, WidgetBuilder> {
        '/test': (BuildContext ctx) => new RouteTest(),
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('list demo'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }
  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      // itemBuilder 是懒加载的么
      itemBuilder: (ctx, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asCamelCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
  void _pushSaved() {
    // contxt 是全局变量么，类似 this 么
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (ctx) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asCamelCase,
                  style: _biggerFont,
                ),
                onTap: _pushTest,
              );
            }
          );
          final divided = ListTile.divideTiles(
            context: ctx,
            tiles: tiles
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Some Saved Suggestion'),
            ),
            body: new ListView(children: divided),
          );
        }
      )
    );
  }
  void _pushTest() {
    Navigator.pushNamed(context, '/test');
  }
}
