import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 167, 10, 96),
        child: const Icon(Icons.access_alarm_outlined),
        onPressed: () {}
        ),
      backgroundColor: const Color.fromARGB(255, 21, 188, 218),
      body: const Center(child: Text("Screen 2")),
    );
  }
}
