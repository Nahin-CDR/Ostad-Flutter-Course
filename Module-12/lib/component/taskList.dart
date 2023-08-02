import 'package:flutter/material.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utility/colorManager.dart';

ListView taskList(taskItem,deleteItem,statusChange){
  return ListView.builder(
      itemCount: taskItem.length,
      itemBuilder:(context,index){
        Color statusColor = ColorManager.colorGreen;
        if(taskItem[index]['status'] == "New"){
          statusColor = ColorManager.colorBlue;
        }else if(taskItem[index]['status'] == "Progress"){
          statusColor = ColorManager.colorOrange;
        }else if(taskItem[index]['status'] == "Canceled"){
          statusColor = ColorManager.colorRed;
        }
        return Card(
          child: itemSizedBox(
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(taskItem[index]['title'],style: head6Text(ColorManager.colorDarkBlue)),
                Text(taskItem[index]['description'],style: head5Text(ColorManager.colorLightGray)),
                Text(taskItem[index]['createdDate'],style: head4Text(ColorManager.colorDarkBlue)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    statusChild(
                      taskItem[index]['status'],
                      statusColor
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: (){
                              statusChange(taskItem[index]['_id']);
                            },
                            style: appStatusButtonStyle(ColorManager.colorDarkBlue),
                            child: const Icon(
                                Icons.edit_location_alt_outlined,
                                size: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 50,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: (){
                              deleteItem(taskItem[index]['_id']);
                            },
                            style: appStatusButtonStyle(ColorManager.colorRed),
                            child: const Icon(
                              Icons.delete_outline,
                              size: 16,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ),
        );
      }
  );
}

