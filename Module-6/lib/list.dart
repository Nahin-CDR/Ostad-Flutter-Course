import 'package:flutter/material.dart';
import 'package:module_6/resources/asset_manager.dart';

class ImageList extends StatelessWidget{
  final List list = [
    {
      "image" : AssetManager.sidePic1,
      "title" : "Sample Photo 1",
      "subTitle" : "Category 1"
    },
    {
      "image" : AssetManager.sidePic2,
      "title" : "Sample Photo 2",
      "subTitle" : "Category 2"
    },
    {
      "image" : AssetManager.sidePic3,
      "title" : "Sample Photo 3",
      "subTitle" : "Category 3"
    },
    {
      "image" : AssetManager.sidePic4,
      "title" : "Sample Photo 4",
      "subTitle" : "Category 4"
    },
    {
      "image" : AssetManager.sidePic5,
      "title" : "Sample Photo 5",
      "subTitle" : "Category 5"
    }
  ];

  ImageList({super.key});
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scrollbar(
      controller: scrollController,
        child: ListView.builder(
          controller: scrollController,
            itemCount: 5,
            itemBuilder:(context,index){
            return Container(
              margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
              child: ListTile(
                tileColor: Colors.blueGrey.withOpacity(.2),
                leading: Image.asset(list[index]['image']),
                title: Text(list[index]['title']),
                subtitle: Text(list[index]['subTitle']),
            ),
          );
        })
    );
  }
}