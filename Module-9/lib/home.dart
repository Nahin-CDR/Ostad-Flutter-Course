import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'displayweather.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

bool loading = true;
Map<String,dynamic>mapResponse={};
class _HomeViewState extends State<HomeView> {

  final String api = "https://api.openweathermap.org/data/2.5/weather?q=mymensingh&appid=50978f07fb55fae4d2bca33d21cc1912";

  Future<dynamic>fetchWeather()async{
    try{
      final response = await http.get(Uri.parse(api));
      if(response.statusCode == 200){
        setState(() {
          mapResponse = jsonDecode(response.body);
          loading = false;
        });
        print(mapResponse);
      }
    }catch(e){
      Fluttertoast.showToast(
          msg: "Error Occurred !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }


  @override
  void initState() {
    setState(() {
      loading = true;
    });
    fetchWeather();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Weather"),
      ),
      body: loading? const Center(
        child: CircularProgressIndicator(),
      ):Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("${mapResponse["name"]}",
                style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
            )),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text("Updated : ${DateTime.now().hour-12} ${DateTime.now().minute} ${DateTime.now().hour>12?"PM":"AM"}",
                style: const TextStyle(
                fontSize: 15,
                color: Colors.green,
            )),
          ),
          Expanded(child: SingleChildScrollView(
            child: weatherView(
              screenWidth : MediaQuery.of(context).size.width-50,
              currentTemperature: "${(mapResponse['main']['temp']-273.15).toStringAsFixed(2)} \u2103",
              city: mapResponse['name'],
              feelsLike: "${(mapResponse['main']['feels_like']-273.15).toStringAsFixed(2)} \u2103",
              minTemperature: "${(mapResponse['main']['temp_min']-273.15).toStringAsFixed(2)} \u2103",
              maxTemperature:"${(mapResponse['main']['temp_max']-273.15).toStringAsFixed(2)} \u2103",
              humidity: "${mapResponse['main']['humidity']} %",
              country: mapResponse['sys']['country'],
              pressure: "${mapResponse['main']['pressure']}",
              visibility: "${mapResponse['visibility']}",
              windSpeed: "${mapResponse['wind']['speed']} km/h",
              weatherOverView: mapResponse['weather'][0]['description'],
            ),
          ))
        ],
      ),
    );
  }
}
