import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stream<double> doubleStream = Stream.periodic(
    Duration(seconds: 2),
    (count) {
      double value = Random().nextDouble() * 100;
      return double.parse(value.toStringAsFixed(2));
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Builder - GERCEP'),
      ),
      body: Center(
        child: StreamBuilder<double>(
          stream: doubleStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              double? data = snapshot.data;
              return Text(
                'Nilai: ${data.toString()}',
                style: TextStyle(fontSize: 50),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
