import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Photo Gallery"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: const Text("Welcome to My Photo Gallery",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87
                  )
              ),
            ),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
