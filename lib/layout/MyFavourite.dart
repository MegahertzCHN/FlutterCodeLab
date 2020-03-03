import 'package:flutter/material.dart';

class MyFavourite extends StatefulWidget {
  MyFavourite(Key key) : super(key: key);

  @override
  _MyFavouriteState createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我喜欢的"),
        backgroundColor: Colors.pink,
      ),
      body: Center(child: GestureDetector(
        child: Icon(Icons.backup),
        onTap: () {
          Navigator.pop(context, true);
        },
      ),),
    );
  }
}