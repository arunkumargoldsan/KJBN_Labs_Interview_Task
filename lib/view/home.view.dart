import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kjbn_labes_interview_task/widgets/custom_alert.widget.dart';
import 'package:kjbn_labes_interview_task/widgets/custom_card.widget.dart';
import 'package:kjbn_labes_interview_task/widgets/custom_timer.widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  late Timer _timer;
  late int _currentSecond;
  late int _randomNumber;
  late int _durationTime = 5;
  late int _status = 0;
  late int attempts = 0;
  late int score = 0;

  @override
  void initState() {
    super.initState();
    attempts = 0;
    score = 0;
    _status = 0;
    getCurrentSecond();
    getRandomNumber();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    attempts = 0;
    score = 0;
    _status = 0;
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (Timer t) {
      setState(() {
        if (_durationTime == 0) {
          _status = 3;
          _timer.cancel();
        } else {
          _durationTime--;
        }
      });
    });
  }

  void getRandomNumber() {
    setState(() {
      _randomNumber = Random().nextInt(60);
    });
  }

  void getCurrentSecond() {
    setState(() {
      _currentSecond = DateTime.now().second;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KJBN Labs"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(10.0),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: [
                  customCard(
                      "Current Second",
                      '$_currentSecond',
                      Colors.lightBlueAccent.shade100,
                      Colors.lightBlueAccent.shade700),
                  customCard(
                      "Random Number",
                      '$_randomNumber',
                      Colors.deepPurpleAccent.shade100,
                      Colors.deepPurpleAccent.shade700),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Visibility(
              visible: _status == 1 ? true : false,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: customAlert("Success :)", "Score: ", attempts, score,
                    Colors.green.shade700, Colors.green.shade900, _status),
              ),
            ),
            Visibility(
              visible: _status == 2 ? true : false,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: customAlert(
                    "Sorry try again!",
                    "Attempts: ",
                    attempts,
                    score,
                    Colors.yellow.shade700,
                    Colors.yellow.shade800,
                    _status),
              ),
            ),
            Visibility(
              visible: _status == 3 ? true : false,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: customAlert(
                    "Sorry! timeout and one attempt is considered for failure as penalty",
                    "Result: ",
                    attempts,
                    score,
                    Colors.red.shade700,
                    Colors.red.shade900,
                    _status),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: customTimer(_durationTime),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_currentSecond == _randomNumber) {
                      _status = 1;
                      score++;
                      getCurrentSecond();
                      getRandomNumber();
                      _durationTime = 5;
                      startTimer();
                    } else {
                      _status = 2;
                      attempts++;
                      getCurrentSecond();
                      getRandomNumber();
                      _durationTime = 5;
                      startTimer();
                    }
                  });
                },
                child: const Text('Click'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
