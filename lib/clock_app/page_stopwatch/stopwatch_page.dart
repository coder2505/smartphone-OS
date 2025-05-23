import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/clock_app/clock_app_riverpod.dart';
import 'package:mobile_os_2/global.dart';

class StopwatchPage extends ConsumerStatefulWidget {
  const StopwatchPage({super.key});

  @override
  ConsumerState<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends ConsumerState<StopwatchPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(stopwatchstartProvider);
    ref.watch(timeHoursProvider);
    ref.watch(timeMinutesProvider);
    ref.watch(timeMinutesProvider);
    ref.watch(timeMilliSecondsProvider);

    double width = MediaQuery.sizeOf(context).width;

    bool pressedStart = ref.read(stopwatchstartProvider.notifier).state;
    String timeHours = ref.read(timeHoursProvider.notifier).state;
    String timeMinutes = ref.read(timeMinutesProvider.notifier).state;
    String timeSeconds = ref.read(timeSecondsProvider.notifier).state;
    String timeMilliSeconds = ref.read(timeMilliSecondsProvider.notifier).state;

    void startTime() {
      Global.stopwatch.start();
      Global.timer = Timer.periodic(Duration(milliseconds: 1), (t) {
        if (Global.stopwatch.isRunning) {
          if (mounted) {
            ref.read(timeMinutesProvider.notifier).state = Global
                .stopwatch
                .elapsed
                .toString()
                .substring(2, 4);
            ref.read(timeSecondsProvider.notifier).state = Global
                .stopwatch
                .elapsed
                .toString()
                .substring(5, 7);
            ref.read(timeMilliSecondsProvider.notifier).state = Global
                .stopwatch
                .elapsed
                .toString()
                .substring(8, 10);
          }
        }
      });
    }

    void stopTime() {
      Global.timer?.cancel();
      Global.stopwatch.stop();
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    timeMinutes,
                    style: TextStyle(
                      backgroundColor: Colors.amber,
                      fontFamily: 'CalSans',
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.15,
                    ),
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                      backgroundColor: Colors.red,
                      fontFamily: 'CalSans',
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.15,
                    ),
                  ),
                  Text(
                    timeSeconds,
                    style: TextStyle(
                      backgroundColor: Colors.amber,
                      fontFamily: 'CalSans',
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.15,
                    ),
                  ),
                  Text(
                    ':',
                    style: TextStyle(
                      backgroundColor: Colors.red,
                      fontFamily: 'CalSans',
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.15,
                    ),
                  ),
                  Text(
                    timeMilliSeconds,
                    style: TextStyle(
                      backgroundColor: Colors.amber,
                      fontFamily: 'CalSans',
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (pressedStart) {
                    ref.read(stopwatchstartProvider.notifier).state = false;
                    stopTime();
                  } else {
                    ref.read(stopwatchstartProvider.notifier).state = true;
                    startTime();
                  }
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: Icon(
                    color: Colors.white,
                    pressedStart ? Icons.pause : Icons.play_arrow,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
