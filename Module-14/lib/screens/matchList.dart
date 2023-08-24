import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/routes/routesNames.dart';

class MatchListScreen extends StatefulWidget {

  const MatchListScreen({super.key});

  @override
  State<MatchListScreen> createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("Matches"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("ostadAssignment").snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          return streamSnapshot.hasData ? Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: ListView.builder(
                  itemCount:streamSnapshot.data!.docs.length,
                  itemBuilder: (context,index){
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        tileColor: Colors.grey.withOpacity(.5),
                        title: Text("${streamSnapshot.data!.docs[index]['title']}"),
                        onTap: (){
                          Navigator.pushNamed(
                              context,
                              RouteNames.matchViewScreen,
                              arguments: MatchViewArguments(
                                  time: streamSnapshot.data!.docs[index]['Time'],
                                  team1: streamSnapshot.data!.docs[index]['team1'],
                                  title: streamSnapshot.data!.docs[index]['title'],
                                  team1Goal: streamSnapshot.data!.docs[index]['team1Goal'],
                                  team2: streamSnapshot.data!.docs[index]['team2'],
                                  team2Goal: streamSnapshot.data!.docs[index]['team2Goal'],
                                  totalTime: streamSnapshot.data!.docs[index]['TotalTime']
                              )
                          );
                        },
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    );
              }),
          ) :
          const Center(
            child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator()
            ),
          );
        },
      ),
    );
  }
}
class MatchViewArguments{
  final String time;
  final String totalTime;
  final String team1;
  final String team2;
  final int team1Goal;
  final int team2Goal;
  final String title;

  MatchViewArguments({
    required this.time,
    required this.team1,
    required this.title,
    required this.team1Goal,
    required this.team2,
    required this.team2Goal,
    required this.totalTime
  });
}
