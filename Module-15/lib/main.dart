import 'package:flutter/material.dart';
import 'package:myapp/screens/home.dart';

void main() {
  runApp(const MyMap());
}


class MyMap extends StatelessWidget {
  const MyMap({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark
      ),
      title: "Map Practice",
      home: const Home(),
    );
  }
}

