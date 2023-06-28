import 'package:flutter/material.dart';
import 'package:module_6/resources/asset_manager.dart';

class PhotoGrid extends StatelessWidget{
  PhotoGrid({super.key});
  final List<String> photos = [
    AssetManager.pic1,
    AssetManager.pic2,
    AssetManager.pic3,
    AssetManager.pic4,
    AssetManager.pic5,
    AssetManager.pic6
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
      spacing: 8.0, // Horizontal spacing between photos
      runSpacing: 8.0, // Vertical spacing between photos
      children: photos.map((photoUrl) {
        return Container(
          alignment: Alignment.bottomCenter,
          width: 100.0, // Adjust the width of each photo container as needed
          height: 100.0, // Adjust the height of each photo container as needed
          decoration: BoxDecoration(
            image: DecorationImage(
              onError:(exception, stackTrace) => const Icon(Icons.error),
              image:NetworkImage(photoUrl), // Assuming photoUrl is the URL of each photo
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey.withOpacity(.5))
            ),
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Clicked on photo!"),
                    duration: Duration(milliseconds: 300),
                )
              );
            },
            child: const Text("Caption"),
          ),
        );
      }).toList(),
    );
  }
}