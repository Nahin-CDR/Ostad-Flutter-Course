import 'package:flutter/material.dart';
import 'package:task_manager/component/taskAppBar.dart';
import 'package:task_manager/utility/stringManager.dart';
import 'package:task_manager/utility/utility.dart';

import '../../component/appBottomNavBar.dart';
import '../../component/cancelTaskList.dart';
import '../../component/completedTaskList.dart';
import '../../component/newTaskList.dart';
import '../../component/progressTaskList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomTabIndex = 0;
  onItemTapped(index){
    setState(() {
      bottomTabIndex = index;
    });
  }
  final widgetOptions = const [
    NewTaskList(),
    ProgressTaskList(),
    CompletedTaskList(),
    CancelTaskList()
  ];

  Map<String,String>profileData ={
    "photo":StringManager.image,
    "firstName":"",
    "lastName":"d",
     "email" : ""
  };

  void readProfileData()async{
    String? email = await Utility.readUserData(key: "email");
    String? firstName = await Utility.readUserData(key: "firstName");
    String? lastName = await Utility.readUserData(key: "lastName");
    setState(() {
      profileData["email"] = email.toString();
      profileData["firstName"] = firstName.toString();
      profileData["lastName"] = lastName.toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    readProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar(context,profileData),
      body: widgetOptions.elementAt(bottomTabIndex),
      bottomNavigationBar: appBottomNavBar(currentIndex: bottomTabIndex,onItemTapped: onItemTapped),
    );
  }
}
