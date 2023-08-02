import 'package:flutter/material.dart';
import 'package:task_manager/component/taskList.dart';
import '../api/apiClient.dart';
import '../style/style.dart';
import '../utility/colorManager.dart';
class CancelTaskList extends StatefulWidget {
  const CancelTaskList({super.key});

  @override
  State<CancelTaskList> createState() => _CancelTaskListState();
}

class _CancelTaskListState extends State<CancelTaskList> {
  List taskItems = [];
  bool loading = true;
  String status = "Canceled";
  callData()async{
    ApiClient apiClient = ApiClient();
    var data = await apiClient.taskListRequest("Canceled");
    setState((){
      loading = false;
      taskItems = data;
    });
  }
  Future<void> updateStatus(id)async{
    setState((){
      loading = true;
    });
    ApiClient apiClient = ApiClient();
    await apiClient.taskStatusUpdateRequest(taskId: id.toString(), status: status);
    callData();
    setState((){
      status = "New";
    });
  }
  deleteItem(taskId)async{
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Delete !"),
            content: const Text("Delete once,In cannot be undone"),
            actions: [
              OutlinedButton(
                  onPressed: ()async{
                    Navigator.pop(context);
                    setState(() {
                      loading = true;
                    });
                    ApiClient apiClient = ApiClient();
                    await apiClient.taskDeleteRequest(taskId: taskId);
                    await callData();
                  },
                  child: const Text("Yes")
              ),
              OutlinedButton(
                  onPressed: ()async{
                    Navigator.pop(context);
                  },
                  child: const Text("No")
              )
            ],
          );
        }
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    callData();
    super.initState();
  }
  Future<void> statusChange(id)async{
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return StatefulBuilder(
              builder: (BuildContext context,StateSetter setState){
                return Container(
                  padding: const EdgeInsets.all(30),
                  height: 450,
                  child: Column(
                    children: [
                      RadioListTile(
                          title: const Text("New"),
                          value: "New",
                          groupValue: status,
                          onChanged: (value){
                            setState((){
                              status = value.toString();
                            });
                          }
                      ),
                      RadioListTile(
                          title: const Text("Progress"),
                          value: "Progress",
                          groupValue: status,
                          onChanged: (value){
                            setState((){
                              status = value.toString();
                            });
                          }
                      ),
                      RadioListTile(
                          title: const Text("Completed"),
                          value: "Completed",
                          groupValue: status,
                          onChanged: (value){
                            setState((){
                              status = value.toString();
                            });
                          }
                      ),
                      RadioListTile(
                          title: const Text("Canceled"),
                          value: "Canceled",
                          groupValue: status,
                          onChanged: (value){
                            setState((){
                              status = value.toString();
                            });
                          }
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: ()async{
                            Navigator.pop(context);
                            updateStatus(id);
                          },
                          style: appButtonStyle(),
                          child: successButtonChild("Confirm"),
                        ),
                      )
                    ],
                  ),
                );
              }
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return loading?    const Center(
        child: CircularProgressIndicator(color: ColorManager.colorGreen)
    ):RefreshIndicator(
        child:taskList(
            taskItems,
            deleteItem,
            statusChange
        ),
        onRefresh: ()async{
          await callData();
        }
    );
  }
}
