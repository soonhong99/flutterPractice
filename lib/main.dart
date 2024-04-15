import 'package:flutter/material.dart';

void main() {
  // const : 한번 값을 넣으면 변경할 수 없다.
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 사람들이 우리 앱의 home(widget)에 갔을 때 무엇을 보여줘야 할까?
      // class name constructor
      home: Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: Text('hello flutter'),),
        body: Center(
          child: Text('hello world!'),
        ),
      ),
    );
  }
}


