import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_manager/routes/routesNames.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utility/colorManager.dart';
import 'package:task_manager/utility/utility.dart';

AppBar taskAppBar(BuildContext context,Map profileData){
  return AppBar(
    toolbarHeight: 100,
    automaticallyImplyLeading: false,
    backgroundColor: ColorManager.colorGreen,
    flexibleSpace: Container(
      margin: const EdgeInsets.fromLTRB(10, 40, 10,0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24,
            child: ClipOval(
              child: Image.memory(Utility.showBase64Image(profileData["photo"]))
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(child: Text("${profileData["firstName"]} ${profileData["lastName"]}",style: const TextStyle(color:ColorManager.colorWhite))),
              Text("${profileData["email"]}",style: head4Text(ColorManager.colorWhite))
            ],
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
          onPressed: (){
            Get.toNamed(RoutesName.taskListScreen);
            //Navigator.pushNamed(context, RoutesName.taskListScreen);
          },
          icon: const Icon(Icons.add_circle_outline)
      ),
      IconButton(
          onPressed: (){
            Utility.removeToken();
            Get.offNamed(RoutesName.loginScreen);
          },
          icon: const Icon(Icons.output)
      )
    ],
  );
}





