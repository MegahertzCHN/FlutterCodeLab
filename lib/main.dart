import 'package:flutter/material.dart';
// import './layout/MyHomePage.dart';
import './layout/MyWidget.dart';
// import './layout/StartName.dart';
import './layout/MyTabBar.dart';
import './layout/MyFavourite.dart';
import './layout/HelpCenter.dart';
import './layout/PosterExample.dart';
import './layout/PhotoNetworkExample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyTabBar(),
      debugShowCheckedModeBanner: true,
      routes: <String, WidgetBuilder> {
        "/myHome": (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("据说是自己创造的假首页"),
            ),
          );
        },
        "/myFavour": (BuildContext context) => MyFavourite(key),
        "/helpCenter": (BuildContext context) => HelpCenter(),
        '/posterExample': (BuildContext context) => PosterExample(),
        '/photoNetWorkExample': (BuildContext context) => PhotoNetworkExample(title: '像话吗'),
      },
    );
  }
}

