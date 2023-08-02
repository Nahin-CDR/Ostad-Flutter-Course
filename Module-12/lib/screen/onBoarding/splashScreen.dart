// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_manager/routes/routesNames.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utility/asset_manager.dart';
import '../../utility/utility.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? timer;

  void checkLoginStatus()async{
    String? token = await Utility.readUserData(key: 'token');
    if(token != null){
      Navigator.pushNamedAndRemoveUntil(context,RoutesName.homeScreen, (route) => false);
    }else{
      Navigator.pushNamedAndRemoveUntil(context,RoutesName.loginScreen, (route) => false);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    timer = Timer(const Duration(seconds: 2), () {
      checkLoginStatus();
    });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          Container(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Image.asset(AssetManager.pngLogo,height: 200)
            ),
          ),
          Positioned(
              bottom: 5,
              left: 20,
              child: Image.asset(
                AssetManager.taskManagerLogo,
                height: 250,
              )
          )
        ],
      ),
    );
  }
}
