import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/routes/routesNames.dart';
import 'package:task_manager/screen/onBoarding/emailVerificationScreen.dart';
import 'package:task_manager/screen/onBoarding/loginScreen.dart';
import 'package:task_manager/screen/onBoarding/pinVerificationScreen.dart';
import 'package:task_manager/screen/onBoarding/registrationScreen.dart';
import 'package:task_manager/screen/onBoarding/setPasswordScreen.dart';
import 'package:task_manager/screen/onBoarding/splashScreen.dart';
import 'package:task_manager/screen/profile/profileUpdateScreen.dart';
import 'package:task_manager/screen/task/homeScreen.dart';
import 'package:task_manager/screen/task/taskCreateScreen.dart';
import 'package:task_manager/stateManager/loginController.dart';
import 'package:task_manager/stateManager/summaryController.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: MyApp.globalKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      title: "Task Manager",
      initialRoute: RoutesName.splashScreen,
      getPages: [
        GetPage(name: RoutesName.splashScreen, page: ()=> const SplashScreen()),
        GetPage(name: RoutesName.homeScreen, page: ()=> const HomeScreen()),
        GetPage(name: RoutesName.loginScreen, page: ()=> const LoginScreen()),
        GetPage(name: RoutesName.pinVerificationScreen, page: ()=> const PinVerificationScreen()),
        GetPage(name: RoutesName.setPassWordScreen, page: ()=> const SetPassWordScreen()),
        GetPage(name: RoutesName.registrationScreen, page: ()=> const RegistrationScreen()),
        GetPage(name: RoutesName.taskListScreen, page: ()=> const TaskCreateScreen()),
        GetPage(name: RoutesName.emailVerificationScreen, page: ()=> const EmailVerificationScreen()),
        GetPage(name: RoutesName.profileUpdateScreen, page: ()=> const ProfileUpdateScreen())
      ],
      initialBinding: ControllerBinding(),
      // onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<SummaryController>(SummaryController());
    // TODO: implement dependencies
  }
}