import 'package:flutter/material.dart';
import 'package:task_manager/routes/routesNames.dart';
import 'package:task_manager/screen/onBoarding/emailVerificationScreen.dart';
import 'package:task_manager/screen/onBoarding/pinVerificationScreen.dart';
import 'package:task_manager/screen/onBoarding/registrationScreen.dart';
import 'package:task_manager/screen/onBoarding/setPasswordScreen.dart';
import 'package:task_manager/screen/task/homeScreen.dart';
import 'package:task_manager/component/newTaskList.dart';
import 'package:task_manager/screen/task/taskCreateScreen.dart';
import '../screen/onBoarding/loginScreen.dart';
import '../screen/onBoarding/splashScreen.dart';

class Routes {
  static Route<dynamic>onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>const SplashScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>const LoginScreen());
      case RoutesName.emailVerificationScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>const EmailVerificationScreen());
      case RoutesName.pinVerificationScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>const PinVerificationScreen());
      case RoutesName.setPassWordScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>const SetPassWordScreen());
      case RoutesName.registrationScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>const RegistrationScreen());
      case RoutesName.taskListScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const TaskCreateScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (BuildContext context)=> const HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (BuildContext context){
              return Container(
                padding: const EdgeInsets.all(10),
                child: const Text("No route Selected"),
              );
            }
        );
    }
  }
}