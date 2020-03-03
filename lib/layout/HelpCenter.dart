import 'package:flutter/material.dart';

class HelpCenter extends StatefulWidget {
  // HelpCenter(Key key): super(key: key);

  @override 
  _HelpCenterState createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {

  @override
  void initState() {
    super.initState();
  }

  void _goPosterExample() {
    print('heih');
    Navigator.pushNamed(context, '/posterExample');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("帮助中心"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), color: Colors.black12, onPressed: _goPosterExample,)
        ],
      ),
      body: Center(child: Row(
        children: <Widget>[
          Text("name")
        ],
      ),),
    );
  }
}