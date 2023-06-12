

import 'package:flutter/material.dart';



class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final List itemList = [
    "Egg",
    "Condom",
    "Toothpaste",
    "Tea",
    "Pad",
    "Jell"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Shopping List"),
        actions: [
          IconButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Cart is empty"))
                );
              },
              icon: const Icon(Icons.add_shopping_cart)
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15,right: 15,top: 20),
            child:  ListTile(
              iconColor: Colors.red,
              contentPadding: const EdgeInsets.all(2),
              tileColor: Colors.blueGrey.withOpacity(.2),
              leading: const Icon(Icons.shopping_basket),
              title: const Text("Egg"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
            child:  ListTile(
              iconColor: Colors.red,
              contentPadding: const EdgeInsets.all(2),
              tileColor: Colors.blueGrey.withOpacity(.2),
              leading: const Icon(Icons.shopping_basket),
              title: const Text("Fruit"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
            child:  ListTile(
              iconColor: Colors.red,
              contentPadding: const EdgeInsets.all(2),
              tileColor: Colors.blueGrey.withOpacity(.2),
              leading: const Icon(Icons.shopping_basket),
              title: const Text("Cake"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
            child:  ListTile(
              iconColor: Colors.red,
              contentPadding: const EdgeInsets.all(2),
              tileColor: Colors.blueGrey.withOpacity(.2),
              leading: const Icon(Icons.shopping_basket),
              title: const Text("Chips"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
            child:  ListTile(
              iconColor: Colors.red,
              contentPadding: const EdgeInsets.all(2),
              tileColor: Colors.blueGrey.withOpacity(.2),
              leading: const Icon(Icons.shopping_basket),
              title: const Text("Chicken"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
            child:  ListTile(
              iconColor: Colors.red,
              contentPadding: const EdgeInsets.all(2),
              tileColor: Colors.blueGrey.withOpacity(.2),
              leading: const Icon(Icons.shopping_basket),
              title: const Text("Meat"),
            ),
          )
        ],
      ),
    );
  }
}
