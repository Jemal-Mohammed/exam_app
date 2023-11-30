import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Home.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late dynamic arguments;

  @override
  void initState() {
    super.initState();
    // Access arguments in initState
    arguments = Get.arguments ?? 'No data received';
  }

  String getMessage(int score) {
    if (score >= 45) {
      return 'Excellent!';
    } else if (score >= 38) {
      return 'Very Good!';
    } else if (score >= 30) {
      return 'Good';
    } else if (score >= 25) {
      return 'Enough';
    } else {
      return 'Poor';
    }
  }

  @override
  Widget build(BuildContext context) {
    int score = arguments ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Result Screen'),
      ),
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Score: $score',
                style: TextStyle(
                  fontSize: 36.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "sTATUs :${getMessage(score)}",
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(const MyHomePage());
                },
                child: const Text(
                  "Back To Home",
                  style: TextStyle(
                      color: Colors.amber,
                      fontStyle: FontStyle.italic,
                      fontSize: 25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
