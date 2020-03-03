import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  Widget _buildSuggessions() {
    return  ListView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      });
  }
  Widget _buildRow(WordPair wordpair) {
    final bool alreadySaved = _saved.contains(wordpair);
    return ListTile(
      title: Text(
        wordpair.asPascalCase,
        style: _biggerFont
        ), 
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
        ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordpair);
          } else {
            _saved.add(wordpair);
          }
        });
      },
      );
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页首页首页首页首页首页首页首页首页首页首页首页'),
        actions: <Widget> [
        IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
      ],
        backgroundColor: Colors.blue,),
      body: _buildSuggessions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void> (
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                )
              );
            }
          );
          final List<Widget> divided = ListTile
            .divideTiles(
              context: context,
              tiles: tiles,
            )
            .toList();
          return Scaffold(
            appBar: AppBar(title: Text('Saved Suggestions')),
            body: ListView(children: divided),
          );
        }
        
      )
    );
  }
}

class RandomWords extends StatefulWidget {
  @override 
  RandomWordsState createState() => RandomWordsState();
}


class StartName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: RandomWords()
    );
  }
}