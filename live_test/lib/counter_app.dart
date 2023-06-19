import 'package:flutter/material.dart';
import 'package:live_test/second_screen.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counter = 0;
  Future<dynamic> showDialogue({required BuildContext context}){
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Counter Alert!"),
          content: const Text("Counter value is 5!"),
          actions: [
            OutlinedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text("ok")
            )
          ],
        );
      },

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Counter Value ",style: TextStyle(fontSize: 20)),
          Text("$counter",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  flex: 2,
                  child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.green
                  ),
                  onPressed: (){

                    setState(() {
                      counter++;
                    });
                    if(counter == 5){
                      showDialogue(context: context);
                    }
                    if(counter == 10){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>const SecondScreen()));
                    }
                  },
                  child: const Icon(Icons.add,color: Colors.white)
              )),
              Flexible(
                  flex: 1,
                  child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent
                  ),
                  onPressed: (){
                    if(counter>0){
                      setState(() {
                        counter--;
                      });
                    }
                  },
                  child: const Icon(Icons.minimize,color: Colors.white)
              )
              )
            ],
          )
        ],
      ),
    );
  }
}
