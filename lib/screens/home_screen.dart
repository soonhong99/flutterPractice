import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  int totalPomodoros = 0;
  bool isRunning = false;
  late Timer timer;

  // 1초마다 UI가 갱신되는 함수 (setState())
  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros += 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  void onStartPressed() {
    // timer가 돌아가는 지점. 1초마다 onTick 함수를 실행.
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onRestartPressed() {
    timer.cancel();
    setState(() {
      totalSeconds = twentyFiveMinutes;
      isRunning = false;
    });
  }

  // seconds to minute and second
  String format(int totalSeconds) {
    // input인 totalSeconds property가 Duration의 인자인 seconds에 들어간다.
    var duration = Duration(seconds: totalSeconds);
    return duration.toString().split('.').first.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // 25:00 container
          Flexible(
            flex: 1,
            child: Container(
              // 정렬
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    icon: isRunning
                        ? const Icon(Icons.pause_circle_outline_outlined)
                        : const Icon(Icons.play_circle_outline_outlined),
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                  ),
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    icon: const Icon(Icons.restore_sharp),
                    onPressed: onRestartPressed,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(34),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodors',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                              fontSize: 58,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
