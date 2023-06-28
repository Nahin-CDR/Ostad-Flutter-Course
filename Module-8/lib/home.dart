import 'package:flutter/material.dart';
import 'package:practice/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List workList = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController daysController = TextEditingController();

  void removeTask({required int index}){
    setState(() {
      workList.removeAt(index);
    });
  }

  void addTask({required String title,required String description,required String days}){
    Map<String,dynamic> formData = {
      "title": title,
      "description" : description,
      "days": days
    };
    setState(() {
      workList.add(formData);
      titleController.clear();
      descriptionController.clear();
      daysController.clear();
    });
  }

  Future<dynamic> showDialogue({required BuildContext context}){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Add Task"),
          content: SizedBox(
            height: 250,
            child: Column(
                children: [
                  TextFormField(
                      controller: titleController,
                      decoration : Style.appInputDecoration(label: "Title")
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    maxLines: 5,
                      controller: descriptionController,
                      decoration : Style.appInputDecoration(label: "Description")
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                      controller: daysController,
                      decoration : Style.appInputDecoration(label: "Days Required")
                  ),
                ]
            ),
          ),
          actions: [
            TextButton(
                onPressed: (){
                  String title = titleController.text.toString();
                  String description = descriptionController.text.toString();
                  String days = daysController.text.toString();
                  if(title.isNotEmpty && description.isNotEmpty && days.isNotEmpty){
                    addTask(title: titleController.text, description: description, days: days);
                  }else{
                    // when input field is empty then perform some function here
                  }
                  Navigator.pop(context);
                },
                child: const Text("Save")
            )
          ],
        );
      }
    );
  }

  Future<dynamic>showWorkDetails({required BuildContext context,required Map<String,dynamic>workData,required int index}){
   return showModalBottomSheet(
       shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.vertical(
           top: Radius.circular(25.0)
         )
       ),
       context: context,
       builder: (BuildContext context){
         return SizedBox(
           height: 500,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 margin: const EdgeInsets.only(left: 20,top: 20),
                 child: const Text("Task Details",style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                 )),
               ),
               Container(
                 margin: const EdgeInsets.only(left: 20,top: 20),
                 child : Text("Title : ${workData['description']}",style: Style.normalTextStyle()),
               ),
               Container(
                 alignment: Alignment.centerLeft,
                 margin: const EdgeInsets.only(left: 20,top: 5),
                 child: Text("Description : ${workData['description']}",style: Style.normalTextStyle()),
               ),
               Container(
                 alignment: Alignment.centerLeft,
                 margin: const EdgeInsets.only(left: 20,top: 5),
                 child:Text("Days Required : ${workData['days']}",style: Style.normalTextStyle()),
               ),
               Container(
                 width: MediaQuery.of(context).size.width/3-10,
                 margin: const EdgeInsets.only(left: 20,top:10),
                 child: OutlinedButton(
                     style: Style.appButtonStyle(),
                     onPressed: (){
                       removeTask(index: index);
                       Navigator.pop(context);
                     },
                     child:const Text("Delete",style: TextStyle(color: Colors.white))
                 ),
               )
             ],
           ),
         );
       }
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Task Management"),
      ),
      body: Container(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: workList.length,
              itemBuilder: ((context, index) {
                String description = workList[index]['description'].toString();
                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    title: Text(workList[index]['title'].toString()),
                    subtitle: Text(description.length >= 30?"${description.substring(0,30)}...":description),
                    tileColor: Colors.blueGrey.withOpacity(.2),
                    onLongPress: (){
                      showWorkDetails(context: context, workData: workList[index],index: index);
                    },
                  ),
                );
              })
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          showDialogue(context: context);
        },
      ),
    );
  }
}
