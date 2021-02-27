import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter MaterialApp',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter AppBar'),
        ),
        body: Center(
          child: Text('Hello world!'),
        ),
      ),
    );
  }
}
