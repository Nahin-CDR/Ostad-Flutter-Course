import 'package:flutter/material.dart';
import 'package:task_manager/routes/routes.dart';
import 'package:task_manager/routes/routesNames.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      title: "Task Manager",
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
