import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../api/apiClient.dart';
import '../../routes/routesNames.dart';
import '../../style/style.dart';
import '../../utility/colorManager.dart';
import '../../utility/toastMessage.dart';
class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  Map<String,String>formValues = {
    "email":""
  };
  bool loading = false;
  void inputOnChange({required key,required textValue}){
    setState(() {
      formValues.update(key, (value) => textValue);
    });
  }
  Future<void> formOnSubmit()async{
    if(formValues["email"]!.isEmpty){
      Message.errorToast("No email");
    }else{
      setState(() {
        loading = true;
      });
      ApiClient apiClient = ApiClient();
      bool response = await apiClient.verifyEmailRequest(userMail:formValues['email'].toString());
      if(response==true){
        Message.successToast("success");
        //Navigate to DashBoard
        // ignore: use_build_context_synchronously
        Get.offNamed(RoutesName.pinVerificationScreen);
       //Navigator.pushNamedAndRemoveUntil(context, RoutesName.pinVerificationScreen, (route) => false);
      }
      setState(() {
        loading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          loading?const Center(child: CircularProgressIndicator(color: ColorManager.colorGreen)):Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your email address",style: head1Text(textColor: ColorManager.colorDarkBlue)),
                const SizedBox(height: 1),
                const Text("A 6 digit pin verification will send to your mail address"),
                const SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration(label: "Email Address"),
                onChanged: (value){
                  inputOnChange(key: "email", textValue:value);
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
