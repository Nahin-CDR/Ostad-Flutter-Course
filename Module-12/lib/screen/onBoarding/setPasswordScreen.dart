import 'package:flutter/material.dart';
import '../../api/apiClient.dart';
import '../../routes/routesNames.dart';
import '../../style/style.dart';
import '../../utility/colorManager.dart';
import '../../utility/toastMessage.dart';
import '../../utility/utility.dart';
class SetPassWordScreen extends StatefulWidget {
  const SetPassWordScreen({super.key});
  @override
  State<SetPassWordScreen> createState() => _SetPassWordScreenState();
}

class _SetPassWordScreenState extends State<SetPassWordScreen> {
  Map<String,String>formValues = {
    "email":"",
    "OTP":"",
    "password":"",
    "confirmPassword":""
  };
  Future<void> getEmailOTP()async{
    String? emailAddress = await Utility.readUserData(key: "emailVerification");
    String? otp = await Utility.readUserData(key: "otp");
    setState(() {
      formValues["email"] = emailAddress.toString();
      formValues["OTP"] = otp.toString();
    });
  }
  bool loading = false;
  void inputOnChange({required key,required textValue}){
    setState(() {
      formValues.update(key, (value) => textValue);
    });
  }
  Future<void> formOnSubmit()async{
    if(formValues["password"]!.isEmpty){
      Message.errorToast("password required");
    }else if(formValues["password"] != formValues["confirmPassword"]){
      Message.errorToast("password didn't match");
    }else{
      setState(() {
        loading = true;
      });
      ApiClient apiClient = ApiClient();
      await getEmailOTP();
      bool response = await apiClient.setPasswordRequest(formValues: formValues);
      if(response==true){
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false);
      }else{
        setState(() {
          loading = false;
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
          loading?const Center(child: CircularProgressIndicator(color: ColorManager.colorGreen)):Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Set Password",style: head1Text(textColor: ColorManager.colorDarkBlue)),
                const SizedBox(height: 1),
                const Text("Minimum 8 character password with letter and number combination"),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: appInputDecoration(label: "Password"),
                  onChanged: (value){
                    inputOnChange(key: "password", textValue: value);
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: appInputDecoration(label: "Confirm Password"),
                  onChanged: (value){
                    inputOnChange(key: "confirmPassword", textValue: value);
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: (){
                      formOnSubmit();
                    },
                    style: appButtonStyle(),
                    child: successButtonChild("Confirm")
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
