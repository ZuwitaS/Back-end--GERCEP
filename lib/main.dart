import 'dart:async';
import 'dart:math'; // Import dart:math untuk menghasilkan nilai acak
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
  StreamController<double> _streamController = StreamController<double>();

  Stream<double> get doubleStream => _streamController.stream;

  @override
  void initState() {
    super.initState();
    sendData();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  void sendData() {
  Timer.periodic(Duration(seconds: 2), (timer) {
    double value = Random().nextDouble() * 100; // Menghasilkan nilai double acak antara 0 dan 100
    value = double.parse(value.toStringAsFixed(2)); // Batasi menjadi 2 digit desimal
    _streamController.add(value);
  });
}


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
              return Text('Nilai: ${data.toString()}');

            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
