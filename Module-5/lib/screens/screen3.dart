import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.access_alarm_outlined),
        onPressed: () {}
        ),
      backgroundColor: Color.fromARGB(255, 92, 81, 255),
      body: const Center(child: Text("Screen 3")),
    );
  }
}
