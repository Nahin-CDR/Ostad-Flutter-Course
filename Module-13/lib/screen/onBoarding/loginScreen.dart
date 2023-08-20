import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_manager/screen/task/homeScreen.dart';
import 'package:task_manager/stateManager/loginController.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utility/colorManager.dart';
import '../../routes/routesNames.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Map<String,String>formValues = {
  //   "email":"",
  //   "password":""
  // };
  bool loading = false;
  // void inputOnChange({required key,required textValue}){
  //   setState(() {
  //     formValues.update(key, (value) => textValue);
  //   });
  // }
  // Future<void> formOnSubmit()async{
  //   if(formValues["email"]!.isEmpty){
  //     Message.errorToast("No email");
  //   }else if(formValues["password"]!.isEmpty){
  //     Message.errorToast("password required");
  //   }else{
  //     setState(() {
  //       loading = true;
  //     });
  //     ApiClient apiClient = ApiClient();
  //     bool response = await apiClient.loginRequest(formValues: formValues);
  //     if(response==true){
  //       Message.successToast("success");
  //       //Navigate to DashBoard
  //       // ignore: use_build_context_synchronously
  //       Get.offNamed(RoutesName.homeScreen);
  //     }
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          loading?const Center(child: CircularProgressIndicator(color: ColorManager.colorGreen)):Container(
            padding: const EdgeInsets.all(30),
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Get Started With",style: head1Text(textColor: ColorManager.colorDarkBlue)),
                const SizedBox(height: 1),
                const Text("Learn with Nahin the Coder"),
                const SizedBox(height: 20),
                TextFormField(
                    controller: mailController,
                    decoration: appInputDecoration(label: "Email Address"),
                    // onChanged: (value){
                    //   inputOnChange(key: "email", textValue:value);
                    // }
                ),
                const SizedBox(height: 20),
                TextFormField(
                    controller: passwordController,
                    decoration: appInputDecoration(label: "Password"),
                    // onChanged: (value){
                    //   inputOnChange(key: "password", textValue:value);
                    // }
                ),
                const SizedBox(height: 20),
                GetBuilder<LoginController>(
                    builder: (loginController){
                     return SizedBox(
                       width: double.infinity,
                       child: Visibility(
                         visible: loginController.loginInProgress == false,
                         replacement: const Center(
                           child: CircularProgressIndicator(),
                         ),
                         child: ElevatedButton(
                           style: appButtonStyle(),
                           onPressed: ()async{
                             bool res = await loginController.login(mailController.text,passwordController.text);
                               if(res==true){
                                 Get.offAll(const HomeScreen());
                               }else{
                                 Get.snackbar('Failed', 'Login failed! Try again.');
                               }
                           },
                           child: successButtonChild("Login"),
                         ),
                       ),
                     );
                    }
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: (){
                          Get.toNamed(RoutesName.emailVerificationScreen);
                        },
                        child: Text("Forget Password?",style: head6Text(ColorManager.colorLightGray)),
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: (){
                          Get.toNamed(RoutesName.registrationScreen);
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
  Get.offNamed(RoutesName.setPassWordScreen);
  ///Navigator.pushNamedAndRemoveUntil(context, RoutesName.taskListScreenRoutesName.taskListScreen, (route) => false);
}