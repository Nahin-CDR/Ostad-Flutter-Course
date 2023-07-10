
import 'dart:ui';

import 'package:flutter/material.dart';

Widget weatherView({
// IconData icon,
  required double screenWidth,
  required String currentTemperature,
  required String city,
  required String feelsLike,
  required String minTemperature,
  required String maxTemperature,
  required String humidity,
  required String country,
  required String visibility,
  required String windSpeed,
  required String pressure,
  required String weatherOverView,
}){
  return Center(

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                  weatherOverView,
                  style:const
                  TextStyle(
                    fontSize: 25,
                    color: Colors.black12,
                  )
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0,),
        Container(
          height : 150,
          margin: const EdgeInsets.only(left: 20),
          width : screenWidth,
          decoration : BoxDecoration(
            borderRadius : BorderRadius.circular(10),
            color : Colors.white,
            boxShadow:const[
              BoxShadow(color: Colors.grey,offset:Offset(5.0,5.0),blurRadius: 10.0,spreadRadius: 2.0,), //BoxShadow
              BoxShadow(color: Colors.white,offset: Offset(0.0, 0.0),blurRadius: 0.0,spreadRadius: 0.0,)
            ],
          ),
          child: Center(
            child:  Text(currentTemperature,
                style:const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(25, 19, 66, 1.0)
                )
            ),
          ),

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                  margin: const EdgeInsets.only(top: 15,right: 10),
                  height : 100,
                  width : screenWidth/2,
                  decoration : BoxDecoration(
                    borderRadius : BorderRadius.circular(10),
                    color : Colors.white,
                    boxShadow:const[
                      BoxShadow(color: Colors.grey,offset:Offset(5.0,5.0),blurRadius: 10.0,spreadRadius: 2.0,), //BoxShadow
                      BoxShadow(color: Colors.white,offset: Offset(0.0, 0.0),blurRadius: 0.0,spreadRadius: 0.0,)
                    ],
                  ),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(

                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 5,bottom: 10),
                        child:const Text("Feels Like :",style: TextStyle(fontSize: 15,color: Colors.grey,)),
                      ),
                      Text(feelsLike,style:const TextStyle(fontSize: 25,color: Colors.black)),
                    ],
                  )

              ),
              onTap: (){

              },
            ),
            Container(
                margin: const EdgeInsets.only(top: 15,right: 10),
                height : 100,
                width : screenWidth/2,
                decoration : BoxDecoration(
                  borderRadius : BorderRadius.circular(10),
                  color : Colors.white,
                  boxShadow:const[
                    BoxShadow(color: Colors.grey,offset:Offset(5.0,5.0),blurRadius: 10.0,spreadRadius: 2.0,), //BoxShadow
                    BoxShadow(color: Colors.white,offset: Offset(0.0, 0.0),blurRadius: 0.0,spreadRadius: 0.0,)
                  ],
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(

                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 5,bottom: 10),
                      child:const Text("Location :",style: TextStyle(fontSize: 15,color: Colors.grey,)),
                    ),
                    Text("$city , $country",style:const TextStyle(fontSize: 15,color: Colors.black)),
                  ],
                )

            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 15,right: 10),
                height : 100,
                width : screenWidth/2,
                decoration : BoxDecoration(
                  borderRadius : BorderRadius.circular(10),
                  color : Colors.white,
                  boxShadow:const[
                    BoxShadow(color: Colors.grey,offset:Offset(5.0,5.0),blurRadius: 10.0,spreadRadius: 2.0,), //BoxShadow
                    BoxShadow(color: Colors.white,offset: Offset(0.0, 0.0),blurRadius: 0.0,spreadRadius: 0.0,)
                  ],
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(

                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 5,bottom: 10),
                      child:const Text("Humidity :",style: TextStyle(fontSize: 15,color: Colors.grey,)),
                    ),
                    Text(humidity,style:const TextStyle(fontSize: 25,color: Colors.black)),
                  ],
                )

            ),
            Container(
                margin: const EdgeInsets.only(top: 15,right: 10),
                height : 100,
                width : screenWidth/2,
                decoration : BoxDecoration(
                  borderRadius : BorderRadius.circular(10),
                  color : Colors.white,
                  boxShadow:const[
                    BoxShadow(color: Colors.grey,offset:Offset(5.0,5.0),
                      blurRadius: 10.0,spreadRadius: 2.0,), //BoxShadow
                    BoxShadow(color: Colors.white,offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,spreadRadius: 0.0,)
                  ],
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(

                      alignment: Alignment.topCenter,
                      margin:const EdgeInsets.only(top: 5,bottom: 10),
                      child:const Text("Visibility :",style: TextStyle(fontSize: 15,color: Colors.grey,)),
                    ),
                    Text("$visibility m",style:const TextStyle(fontSize: 18,color: Colors.black)),
                  ],
                )

            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 15,right: 10),
                height : 100,
                width : screenWidth/2,
                decoration : BoxDecoration(
                  borderRadius : BorderRadius.circular(10),
                  color : Colors.white,
                  boxShadow:const[
                    BoxShadow(color: Colors.grey,offset:Offset(5.0,5.0),blurRadius: 10.0,spreadRadius: 2.0,), //BoxShadow
                    BoxShadow(color: Colors.white,offset: Offset(0.0, 0.0),blurRadius: 0.0,spreadRadius: 0.0,)
                  ],
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(

                      alignment: Alignment.topCenter,
                      margin:const EdgeInsets.only(top: 5,bottom: 10),
                      child:const Text("Wind speed :",style: TextStyle(fontSize: 15,color: Colors.grey,)),
                    ),
                    Text(windSpeed,style:const TextStyle(fontSize: 25,color: Colors.black)),
                  ],
                )

            ),
            Container(
                margin: const EdgeInsets.only(top: 15,right: 10),
                height : 100,
                width : screenWidth/2,
                decoration : BoxDecoration(
                  borderRadius : BorderRadius.circular(10),
                  color : Colors.white,
                  boxShadow:const[
                    BoxShadow(color: Colors.grey,offset:Offset(5.0,5.0),blurRadius: 10.0,spreadRadius: 2.0,), //BoxShadow
                    BoxShadow(color: Colors.white,offset: Offset(0.0, 0.0),blurRadius: 0.0,spreadRadius: 0.0,)
                  ],
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(

                      alignment: Alignment.topCenter,
                      margin:const EdgeInsets.only(top: 5,bottom: 10),
                      child:const Text("Pressure :",style: TextStyle(fontSize: 15,color: Colors.grey,)),
                    ),
                    Text("$pressure hPa",style:const TextStyle(fontSize: 18,color: Colors.black)),
                  ],
                )
            ),
          ],
        ),
      ],
    ),
  );
}