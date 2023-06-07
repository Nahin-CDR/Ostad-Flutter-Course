import 'package:flutter/material.dart';

class Module5View extends StatelessWidget {
  const Module5View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 66, 16),
        title: const Text("Module details")
      ),
      backgroundColor: const Color.fromARGB(255, 212, 190, 143),
      body: const Center(
        child: Text("Welcome to Module 5")
      ),
    );
  }
}