import 'package:flutter/material.dart';
import '../../api/apiClient.dart';
import '../../style/style.dart';
import '../../utility/colorManager.dart';
import '../../utility/toastMessage.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  Map<String,String>formData = {
    "email":"",
    "firstName":"",
    "lastName":"",
    "mobile":"",
    "password":"",
    "photo":"",
    "confirmPassword":" "
  };
  bool loading = false;
  void inputOnChange({required key,required textValue}){
    setState(() {
      formData.update(key, (value) => textValue);
    });
  }
  Future<void> formOnSubmit()async{
    if(formData["email"]!.isEmpty){
      Message.errorToast("No email");
    }else if(formData["firstName"]!.isEmpty){
      Message.errorToast("First Name required");
    }else if(formData["lastName"]!.isEmpty){
      Message.errorToast("Last name required");
    } else if(formData["password"]!.isEmpty){
      Message.errorToast("password required");
    }else if(formData["password"]!=formData["confirmPassword"]){
      Message.errorToast("password didn't match");
    }else if(formData["mobile"]!.isEmpty){
      Message.errorToast("Need mobile number");
    } else{
      setState(() {
        loading = true;
      });
      ApiClient apiClient = ApiClient();
      bool response = await apiClient.registrationRequest(formValues: formData);
      if(response){
        Message.successToast("success");
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
          loading? const Center(child: CircularProgressIndicator(color: ColorManager.colorGreen)):Container(
            padding: const EdgeInsets.all(30),
            child: ListView(
              children: [
                Text("Join with us",style: head1Text(textColor: ColorManager.colorDarkBlue)),
                const SizedBox(height: 1),
                const Text("Learn with Nahin the Coder"),
                const SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration(label: "Email Address"),
                  onChanged:(value){
                    inputOnChange(key: "email", textValue: value);
                  } ,
                ),
                const SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration(label: "First Name"),
                  onChanged:(value){
                    inputOnChange(key: "firstName", textValue: value);
                  }
                ),
                const SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration(label: "Last Name"),
                  onChanged:(value){
                    inputOnChange(key: "lastName", textValue: value);
                  } ,
                ),
                const SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration(label: "Mobile"),
                  onChanged:(value){
                    inputOnChange(key: "mobile", textValue: value);
                  }
                ),
                const SizedBox(height: 20),
                TextFormField(decoration: appInputDecoration(label: "Password"),
                  onChanged:(value){
                    inputOnChange(key: "password", textValue: value);
                  } ,
                ),
                const SizedBox(height: 20),
                TextFormField(
                    decoration: appInputDecoration(label: "Confirm Password"),
                    onChanged:(value){
                      inputOnChange(key: "confirmPassword", textValue: value);
                    } ,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: (){
                      formOnSubmit();
                    },
                    style: appButtonStyle(),
                    child: successButtonChild("Registration")
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}