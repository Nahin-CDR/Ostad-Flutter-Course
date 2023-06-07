import 'package:flutter/material.dart';

class Module5Syllabus extends StatelessWidget {
  const Module5Syllabus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 66, 16),
        title: const Text("Syllabus details")
      ),
      backgroundColor: const Color.fromARGB(255, 97, 68, 5),
      body: const Center(
        child: Text("Read Syllabus",style: TextStyle(color: Colors.white))
      ),
    );
  }
}