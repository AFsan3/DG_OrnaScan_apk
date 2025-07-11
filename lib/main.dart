import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DG OrnaScan V2',
      home: Scaffold(
        appBar: AppBar(title: Text('DG OrnaScan')),
        body: Center(child: Text('Welcome to DG OrnaScan V2!')),
      ),
    );
  }
}
