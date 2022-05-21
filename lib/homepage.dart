import 'package:flappybird/pipe.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flappybird/pipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gamehasStarted = false;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    gamehasStarted = true;

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.1;
      height += -4.9 * time * time * 2 * time;
      setState(() {
        birdYaxis = initialHeight = height;
      });
      if (birdYaxis > 0) {
        timer.cancel();
        gamehasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                if (gamehasStarted) {
                  jump();
                } else {
                  startGame();
                }
              },
              child: AnimatedContainer(
                alignment: Alignment(0, 0),
                duration: Duration(milliseconds: 0),
                color: Colors.blue,
                // ignore: prefer_const_constructors
                child: MyPipe(),
              ),
            ),
          ),
          Container(
            height: 10,
            color: Colors.green,
          ),
          Expanded(
            child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("SCORE",
                          style: TextStyle(color: Colors.white, height: 10)),
                      SizedBox(height: 2),
                      Text("0")
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("BEST",
                            style: TextStyle(color: Colors.white, height: 10)),
                        SizedBox(height: 2),
                        Text("10"),
                      ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
