
import 'package:flutter/material.dart';
import 'package:notes/routes/routesNames.dart';
import 'package:notes/screens/noteViewScreen.dart';
import '../screens/matchList.dart';

class Routes{
  static Route<dynamic>onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteNames.matchViewScreen:
        final argument = settings.arguments as MatchViewArguments;
        return MaterialPageRoute(builder: (BuildContext context)=> MatchViewScreen(
          title: argument.title,
          team1: argument.team1,
          team2: argument.team2,
          team1Goal: argument.team1Goal,
          team2Goal: argument.team2Goal,
          time: argument.time,
          totalTime: argument.totalTime,
        ));
      default:
        return MaterialPageRoute(builder:(BuildContext context){
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: Text("No Routes Defined"),
              ),
            ),
          );
        });
    }
  }
}