import 'package:flutter/material.dart';
import 'package:module5/screens/module5.dart';
import 'package:module5/screens/screen1.dart';
import 'package:module5/screens/screen3.dart';
import 'package:module5/screens/syllabus.dart';

import 'screens/screen2.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  int index = 0;
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Module 5"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Row(children: [
              Image.asset("images/pic.png"),
              Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: const Text("Module 5",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))
            ])),
            ListTile(
              leading: const Icon(Icons.run_circle_rounded),
              title: const Text("Go to Module 5"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const Module5View()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("Syllabus"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const Module5Syllabus()));
              },
            )
          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: const [
        Screen1(),
        Screen2(),
        Screen3(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
              tabController!.animateTo(index);
            });
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Page 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Page 2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Page 3',
            ),
          ]),
    );
  }
}
