import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SnackBarDemo());

class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar Demo'),
        ),
        body: SnackBarPage(), //snackBar 를 쓰기위해 곧바로 body 에statelessWidge
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
      onPressed: () {
        final snackBar = SnackBar(
          content: Text('Yay! A SnackBar'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // somde code
            },
          ),
        );
        //화면에 보여주는 거 of
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Text('Show snackBar'),
    ));
  }
}
