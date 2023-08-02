import 'package:flutter/material.dart';
import 'package:task_manager/routes/routesNames.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utility/colorManager.dart';
import 'package:task_manager/utility/utility.dart';

AppBar taskAppBar(BuildContext context,Map profileData){
  return AppBar(

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
              Text("${profileData["firstName"]} ${profileData["lastName"]}",style: head6Text(ColorManager.colorWhite)),
              Text("${profileData["email"]}",style: head4Text(ColorManager.colorWhite))
            ],
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
          onPressed: (){
            Navigator.pushNamed(context, RoutesName.taskListScreen);
          },
          icon: const Icon(Icons.add_circle_outline)
      ),
      IconButton(
          onPressed: (){
            Utility.removeToken();
            Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false);
          },
          icon: const Icon(Icons.output)
      )
    ],
  );
}





