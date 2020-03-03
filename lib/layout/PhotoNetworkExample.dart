import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get('https://jsonplaceholder.typicode.com/photos');
  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBoday) {
  final parsed = jsonDecode(responseBoday).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl']
    );
  }
}

class PhotoNetworkExample extends StatefulWidget {
  final String title;

  PhotoNetworkExample({Key key, this.title}) : super(key: key);

  @override
  _PhotoNetworkState createState() => _PhotoNetworkState();
  
}

class _PhotoNetworkState extends State<PhotoNetworkExample> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Isolate"),
      ),
      body: FutureBuilder(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          print('heiha ==== $snapshot');
          return snapshot.hasData ? PhotosList(photos: snapshot.data) : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatefulWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}): super(key: key);

  @override
  _PhotoListState createState() => _PhotoListState(photos: this.photos);
}

class _PhotoListState extends State<PhotosList> {
  final List<Photo> photos;

  // _PhotoListState({this.photos}): super();
  _PhotoListState({Key key, this.photos}): super();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Center(child: Center(
          child: Column(
            children: <Widget>[
              Image.network(photos[index].thumbnailUrl),
              // Text(photos[index].title),
              // Text(photos[index].title),
              // Row(children: <Widget>[
              // Image.network(photos[index].thumbnailUrl),
              // Text(photos[index].title)
              // ],)
            ],
          ),
        ),);
      },
    );
  }
}