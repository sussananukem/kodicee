import 'dart:math';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int leftNum = 1;
  int rightNum = 1;
  String winMsg = 'Draw!';
  void roll() {
    setState(() {
      leftNum = Random().nextInt(6) + 1;
      rightNum = Random().nextInt(6) + 1;

      if (leftNum > rightNum) {
        winMsg = '🚩Player 1 Wins';
      } else if (rightNum > leftNum) {
        winMsg = 'Player 2 Wins🚩';
      } else {
        winMsg = 'Draw!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('koDice🎲')),
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Colors.blue.shade900,
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                winMsg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green.shade300,
                  fontSize: 40.0,
                  fontFamily: 'Lobster',
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Text(
                      'Player 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Player 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        roll();
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          'images/dice$leftNum.png',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        roll();
                      },
                      style: ButtonStyle(
                        //This removes the highlight color when button is clicked!
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          'images/dice$rightNum.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
