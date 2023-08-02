import 'package:flutter/material.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utility/colorManager.dart';
import 'package:task_manager/utility/toastMessage.dart';

import '../../api/apiClient.dart';
import '../../routes/routesNames.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Map<String,String>formValues = {
    "email":"",
    "password":""
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
    }else if(formValues["password"]!.isEmpty){
      Message.errorToast("password required");
    }else{
      setState(() {
        loading = true;
      });
      ApiClient apiClient = ApiClient();
      bool response = await apiClient.loginRequest(formValues: formValues);
      if(response==true){
        Message.successToast("success");
        //Navigate to DashBoard
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeScreen, (route) => false);
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
                Text("Get Started With",style: head1Text(textColor: ColorManager.colorDarkBlue)),
                const SizedBox(height: 1),
                const Text("Learn with Nahin the Coder"),
                const SizedBox(height: 20),
                TextFormField(
                    decoration: appInputDecoration(label: "Email Address"),
                    onChanged: (value){
                      inputOnChange(key: "email", textValue:value);
                    }
                ),
                const SizedBox(height: 20),
                TextFormField(
                    decoration: appInputDecoration(label: "Password"),
                    onChanged: (value){
                      inputOnChange(key: "password", textValue:value);
                    }
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: (){
                      formOnSubmit();
                    },
                    style: appButtonStyle(),
                    child: successButtonChild("Login")
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context,RoutesName.emailVerificationScreen);
                        },
                        child: Text("Forget Password?",style: head6Text(ColorManager.colorLightGray)),
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context,RoutesName.registrationScreen);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have account? ",style: head6Text(ColorManager.colorDarkBlue)),
                            Text("Sign Up",style: head6Text(ColorManager.colorGreen)),
                          ],
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

navigateToNextScreen({required BuildContext context}){
  Navigator.pushNamedAndRemoveUntil(context, RoutesName.taskListScreen, (route) => false);
}