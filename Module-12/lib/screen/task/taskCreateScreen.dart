import 'package:flutter/material.dart';
import 'package:task_manager/routes/routesNames.dart';
import 'package:task_manager/utility/colorManager.dart';

import '../../api/apiClient.dart';
import '../../style/style.dart';
import '../../utility/toastMessage.dart';
class TaskCreateScreen extends StatefulWidget {
  const TaskCreateScreen({super.key});

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  Map<String,String>formValues = {
    "title":"",
    "description":"",
    "status":"New"
  };
  bool loading = false;
  void inputOnChange({required key,required textValue}){
    setState(() {
      formValues.update(key, (value) => textValue);
    });
  }
  Future<void> formOnSubmit()async{
    if(formValues["title"]!.isEmpty){
      Message.errorToast("No title");
    }else if(formValues["description"]!.isEmpty){
      Message.errorToast("description required");
    }else{
      setState(() {
        loading = true;
      });
      ApiClient apiClient = ApiClient();
      bool response = await apiClient.taskCreateRequest(formData: formValues);
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
      appBar: AppBar(
        backgroundColor: ColorManager.colorGreen,
        title: const Text("Create New Task"),
      ),
      body: Stack(
        children: [
          screenBackground(context),
          loading?const Center(child: CircularProgressIndicator(color: ColorManager.colorGreen)):Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add New Task",style: head1Text(textColor: ColorManager.colorDarkBlue)),
                const SizedBox(height: 20),
                TextFormField(
                    decoration: appInputDecoration(label: "Task Name"),
                    onChanged: (value){
                      inputOnChange(key: "title", textValue:value);
                    }
                ),
                const SizedBox(height: 20),
                TextFormField(
                    maxLines: 5,
                    decoration: appInputDecoration(label: "Info"),
                    onChanged: (value){
                      inputOnChange(key: "description", textValue:value);
                    }
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: (){
                      formOnSubmit();
                    },
                    style: appButtonStyle(),
                    child: successButtonChild("Create")
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
