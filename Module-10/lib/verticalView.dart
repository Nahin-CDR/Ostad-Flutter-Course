
import 'package:flutter/material.dart';
import 'package:module10/res.dart';
Widget buildVerticalLayout(BoxConstraints constraints,BuildContext context) {
  return Center(
    child: Column(
      children: [
        const SizedBox(height: 10),
        Center(
          child: ClipOval(
            child: Image.asset(
              'images/pic.jpg',
              width: MediaQuery.of(context).size.width-10,
              height: MediaQuery.of(context).size.width-10,
              fit: BoxFit.cover
            )
          )
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text("John Doe",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          )),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: const Text(StringResources.text),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(9, (index) {
              return Container(
                color: Colors.blueGrey.withOpacity(.2),
                margin: const EdgeInsets.only(left:2,right: 2,bottom: 2,top: 2),
                child: Center(
                  child: Image.asset('images/pics.jpg')
                ),
              );
            }),
        )
        )
      ],
    ),
  );
}