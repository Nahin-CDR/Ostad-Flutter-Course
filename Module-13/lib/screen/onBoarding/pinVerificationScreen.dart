// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/api/apiClient.dart';
import 'package:task_manager/utility/toastMessage.dart';
import 'package:task_manager/utility/utility.dart';
import '../../routes/routesNames.dart';
import '../../style/style.dart';
import '../../utility/colorManager.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});
  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {

  Map<String,String>formData = {
    "otp" : ""
  };

  void inputOnChange({required String key,required String inputValue}){
    setState(() {
      formData.update(key, (value) => inputValue);
    });
  }
  bool loading = false;
  void formOnSubmit()async{
    if(formData["otp"]!.length != 6){
      Message.errorToast("invalid input");
    }else{
      setState(() {
        loading = true;
      });
      String? emailAddress = await Utility.readUserData(key: "emailVerification");
      ApiClient apiClient = ApiClient();
      bool res = await apiClient.verifyOTPRequest(
          userMail: emailAddress.toString(),
          otp: formData["otp"].toString()
      );
      if(res == true){
        Get.toNamed(RoutesName.setPassWordScreen);
        ///Navigator.pushNamed(context, RoutesName.setPassWordScreen);
      }else{
        setState(() {
          loading = true;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("PIN Verification",style: head1Text(textColor: ColorManager.colorDarkBlue)),
                const SizedBox(height: 1),
                const Text("A 6 digit pin has been sent to your mobile"),
                const SizedBox(height: 20),
                PinCodeTextField(
                    appContext:context,
                    pinTheme: appOtpStyle(),
                    animationType: AnimationType.fade,
                    enableActiveFill: true,
                    length: 6,
                    onCompleted:(value){
                      inputOnChange(key: "otp", inputValue:value);
                    },
                    onChanged: (value){
                      inputOnChange(key: "otp", inputValue:value);
                    },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: (){
                      formOnSubmit();
                    },
                    style: appButtonStyle(),
                    child: successButtonChild("Verify")
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
