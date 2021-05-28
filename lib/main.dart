import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/screen/lot_information.dart';
import 'package:myapp/screen/search_screen.dart';
import 'package:myapp/screen/wafer_status.dart';

Future<Post> fetchPost() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
    return Post.fromJson(json.decode(response.body));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Fetch Data Example'),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                SearchScreen(),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: <Widget>[
                    // Center(child: DrawWaferState()),
                    // FutureBuilder<Post>(
                    //   future: post,
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasData) {
                    //       return Text(snapshot.data.title);
                    //     } else if (snapshot.hasError) {
                    //       return Text("${snapshot.error}");
                    //     }

                    //     // 기본적으로 로딩 Spinner를 보여줍니다.
                    //     return CircularProgressIndicator();
                    //   },
                    // ),

                    Center(child: GetLotInformation())
                  ],
                )
              ],
            ),
          )),
    );
  }
}
