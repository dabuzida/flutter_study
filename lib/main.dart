import 'package:flutter/material.dart';
import 'package:flutter_study/my_value_key.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter',
      home: MyContainer(),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: const MyValueKey(),
    );
  }
}
