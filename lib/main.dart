import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int redScore = 50;
  int blueScore = 50;

  void redScoreUpdate() {
    setState(() {
      redScore += 1;
      blueScore -= 1;
    });
  }

  void blueScoreUpdate() {
    setState(() {
      blueScore += 1;
      redScore -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap_Battle_App',
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: redScore,
                  child: InkWell(
                    onTap: redScoreUpdate,
                    child: Container(color: Colors.redAccent),
                  ),
                ),
                Expanded(
                  flex: blueScore,
                  child: InkWell(
                    onTap: blueScoreUpdate,
                    child: Container(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
            redScore >= 100 || blueScore >= 100
                ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.pinkAccent.withOpacity(0.3),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("x won", style: TextStyle(fontSize: 50)),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                redScore = 50;
                                blueScore = 50;
                              });
                            },
                            child: const Text("Restart"),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
