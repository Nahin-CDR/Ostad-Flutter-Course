import 'package:flutter/material.dart';

class MatchViewScreen extends StatefulWidget {
  final String time;
  final String totalTime;
  final String team1;
  final String team2;
  final int team1Goal;
  final int team2Goal;
  final String title;

  const MatchViewScreen({
   required this.totalTime,
    required this.team2Goal,
    required this.team2,
    required this.team1Goal,
    required this.title,
    required this.team1,
    required this.time,
    super.key
  });

  @override
  State<MatchViewScreen> createState() => _MatchViewScreenState();
}

class _MatchViewScreenState extends State<MatchViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Details")
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            height: 220,
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text("${widget.team1} vs ${widget.team2}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                  const SizedBox(height: 10),
                  Text("${widget.team1Goal} : ${widget.team2Goal}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                  const SizedBox(height: 10),
                  Text("Time : ${widget.time}",style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text("Total Time : ${widget.totalTime}",style: const TextStyle(fontSize: 20))
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
