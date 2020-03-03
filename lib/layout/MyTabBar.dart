import './MyHomePage.dart';
import './MyWidget.dart';
import './StartName.dart';
import './HelpCenter.dart';
import './PosterExample.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  MyTabBar({Key key}) : super(key: key);

  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  int _tabBarIndex = 0;
  List _tabBarPages = [
    MyHomePage(title: 'Flutter Demo Home Page'),
    MyWidget(),
    RandomWords(),
    HelpCenter(),
    PosterExample()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("你瞅啥？")
      // ),
      body: this._tabBarPages[_tabBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 36,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        currentIndex: this._tabBarIndex,
        onTap: (index) {
          setState(() {
            this._tabBarIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页1")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            title: Text("首页2")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.near_me),
            title: Text("收藏")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            title: Text("帮助中心")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            title: Text("网络请求")
          )
        ],
      ),
    );
  }
}