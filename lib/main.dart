import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first application'),
          backgroundColor: Color.fromARGB(200, 100, 200, 110),
        ),
        body:
            Text('This is my first text, that I wrote myself, with my fingers'),
      ),
    );
  }
}
