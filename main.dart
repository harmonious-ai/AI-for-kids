import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:sensors/sensors.dart';
import 'package:flutter_mediapipe/flutter_mediapipe.dart';
import 'package:flutter_mediapipe/gen/landmark.pb.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}

mixin MainView implements StatelessWidget {
  int _counter = 0;
  MethodChannel platform = new MethodChannel('backgroundservice');
  void _incrementCounter() {
    setState(() {
      _counter++;
    }
    );
  }

  void startService() async{
    dynamic value = await platform.invokeMethod("startSetvice");
    print(value);
  }
  bool _turtle = false;
  bool _eye = false;
  bool _hand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bunny&Turtle'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.lightGreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "거북목 증후군",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "아이를 위한 AI",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 41,
                      color: Colors.black,
                    ),
                  ),
                  Padding(

                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: startService, 
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) =>
                                  _turtle ? Colors.greenAccent : Colors.transparent)),
                      child: Image(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        image: AssetImage("imgs/imgss/turtle.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _eye = !(_eye);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) =>
                                  _eye ? Colors.greenAccent : Colors.transparent)),
                      child: Image(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        image: AssetImage("imgs/imgss/eye.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _hand = !(_hand);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) =>
                                  _hand ? Colors.greenAccent : Colors.transparent)),
                      child: Image(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        image: AssetImage("imgs/imgss/hand.png"),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
