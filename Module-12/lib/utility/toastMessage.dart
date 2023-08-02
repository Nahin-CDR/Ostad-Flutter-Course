import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manager/utility/colorManager.dart';

class Message{
  static void successToast(msg){
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: ColorManager.colorGreen,
        textColor: ColorManager.colorWhite,
        fontSize: 16.0
    );
  }


  static void errorToast(msg){
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: ColorManager.colorRed,
        textColor: ColorManager.colorWhite,
        fontSize: 16.0
    );
  }
}