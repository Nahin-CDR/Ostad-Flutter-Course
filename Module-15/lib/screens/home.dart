import 'package:flutter/material.dart';
import 'package:myapp/screens/automaticMapAnimation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:(BuildContext context){
                          return const AutomaticMapAnimation();
                        }
                    )
                );
              },
              child: const Text("Automatic Map Animation")
          )
        ],
      ),
    );
  }
}
