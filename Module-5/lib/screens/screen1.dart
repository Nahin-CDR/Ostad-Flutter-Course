import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 23, 167, 10),
        child: const Icon(Icons.access_alarm_outlined),
        onPressed: () {}
        ),
      body: const Center(child: Text("Screen 1")),
      backgroundColor: Colors.deepOrangeAccent,
    );
  }
}
