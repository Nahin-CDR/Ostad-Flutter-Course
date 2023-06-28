import 'package:flutter/material.dart';
import 'package:module_6/photos.dart';
import 'list.dart';
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
        backgroundColor: const Color.fromARGB(255, 2, 121, 71),
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
                      fontWeight: FontWeight.w600, color: Colors.black87)),
            ),
            Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                      hintText: "Search"
                    ),
                )
            ),
            const SizedBox(
              height: 20,
            ),
            PhotoGrid(),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 420,
              child: ImageList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                duration: Duration(milliseconds: 300),
                content: Text("Photos Uploaded Successfully")
            )
          );
        },
        child: const Icon(Icons.upload),
      ),
    );
  }
}
