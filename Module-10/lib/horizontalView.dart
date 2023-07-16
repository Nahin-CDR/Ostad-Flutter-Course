
import 'package:flutter/material.dart';
import 'package:module10/res.dart';

Widget buildHorizontalLayout(BoxConstraints constraints,BuildContext context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.all(5),
              child: ClipOval(
                  child: Image.asset(
                      'images/pic.jpg',
                      width: MediaQuery.of(context).size.height*.8,
                      height: MediaQuery.of(context).size.height*.8,
                      fit: BoxFit.cover
                  )
              ),
            )
        ),
        Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5,bottom: 5),
                  alignment:Alignment.centerLeft,
                  child: const Text("John Doe",style: TextStyle(
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
        ))
      ],
    ),
  );
}