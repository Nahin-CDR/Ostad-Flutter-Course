import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

List contactList = [
  {
    "name":"Nahin",
     "email":"xyz@gmail.com",
     "phone":"0170000000"
  },
  {
    "name":"Kaspia",
    "email":"xyz@gmail.com",
    "phone":"0170000000"
  },
  {
    "name":"Tasmia",
    "email":"xyz@gmail.com",
    "phone":"0170000000"
  }
];

class _HomeViewState extends State<HomeView> {


  Future<dynamic>showContactDetails({
    required BuildContext context,
    required Map<String,dynamic>contactData}){
    return showModalBottomSheet(
        isDismissible: true,
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
                  child: const Text("Contact Details",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  )),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20,top: 20),
                  child : Text("Name : ${contactData['name']}"),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20,top: 5),
                  child: Text("Email : ${contactData['email']}"),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20,top: 5),
                  child:Text("Phone Number : ${contactData['phone']}"),
                ),
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
        title: const Text("Contact List"),
      ),
      body: ListView.builder(
          itemCount: contactList.length,
          itemBuilder: (context,index){
        return Container(
          margin: const EdgeInsets.all(10),
          child: ListTile(
              tileColor: Colors.brown.withOpacity(.2),
              title: Text("${contactList[index]['name']}"),
              onTap: (){
                showContactDetails(context: context, contactData:contactList[index]);
              },
          ),
        );
      }),
    );
  }
}
