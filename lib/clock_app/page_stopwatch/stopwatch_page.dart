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
    ref.watch(timeProvider);
    ref.watch(stopwatchresetProvider);

    double width = MediaQuery.sizeOf(context).width;

    bool pressedStart = ref.read(stopwatchstartProvider.notifier).state;
    String time = ref.read(timeProvider.notifier).state;

    void startTime() {
      Global.stopwatch.start();
      Global.timer = Timer.periodic(Duration(milliseconds: 10), (t) {
        if (Global.stopwatch.isRunning) {
          if (mounted) {
            ref.read(timeProvider.notifier).state = Global.stopwatch.elapsed
                .toString()
                .substring(2, 10);
          }
        }
      });
    }

    void stopTime() {
      Global.timer?.cancel();
      Global.stopwatch.stop();
    }

    void resetTime() {
      Global.timer?.cancel();
      Global.stopwatch.reset();
      ref.read(timeProvider.notifier).state = '00:00:00';
      ref.read(stopwatchstartProvider.notifier).state = false;
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // THE STOPWATCH TIMER.
          SizedBox(
            child: Center(
              child: Row(
                children: [
                  SizedBox(width: width * 0.2),
                  Text(
                    time,
                    style: TextStyle(
                      fontFamily: 'CalSans',
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.15,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //THE STOP PLAY BUTTONS
          AnimatedSwitcher(
            duration: Duration(milliseconds: 250),
            child:
                ref.read(stopwatchresetProvider.notifier).state
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ref.read(stopwatchresetProvider.notifier).state =
                                false;

                            resetTime();
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                            child: Icon(color: Colors.white, Icons.refresh),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (pressedStart) {
                              ref.read(stopwatchstartProvider.notifier).state =
                                  false;
                              stopTime();
                            } else {
                              ref.read(stopwatchstartProvider.notifier).state =
                                  true;
                              startTime();
                            }

                            ref.read(stopwatchresetProvider.notifier).state =
                                true;
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
                    )
                    : GestureDetector(
                      onTap: () {
                        if (pressedStart) {
                          ref.read(stopwatchstartProvider.notifier).state =
                              false;
                          stopTime();
                        } else {
                          ref.read(stopwatchstartProvider.notifier).state =
                              true;
                          startTime();
                        }

                        ref.read(stopwatchresetProvider.notifier).state = true;
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

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     // RESET BUTTON
            //     if (ref.read(stopwatchresetProvider.notifier).state) ...[
            //       GestureDetector(
            //         onTap: () {
            //           resetTime();
            //         },
            //         child: Container(
            //           width: 100,
            //           height: 100,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(20),
            //             color: Colors.black,
            //           ),
            //           child: Icon(color: Colors.white, Icons.refresh),
            //         ),
            //       ),
            //       // PLAY PAUSE
            //       GestureDetector(
            //         onTap: () {
            //           if (pressedStart) {
            //             ref.read(stopwatchstartProvider.notifier).state = false;
            //             stopTime();
            //           } else {
            //             ref.read(stopwatchstartProvider.notifier).state = true;
            //             startTime();
            //           }
            //           ref.read(stopwatchresetProvider.notifier).state = true;
            //         },
            //         child: Container(
            //           width: 100,
            //           height: 100,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(20),
            //             color: Colors.black,
            //           ),
            //           child: Icon(
            //             color: Colors.white,
            //             pressedStart ? Icons.pause : Icons.play_arrow,
            //           ),
            //         ),
            //       ),
            //     ] else
            //       GestureDetector(
            //         onTap: () {
            //           if (pressedStart) {
            //             ref.read(stopwatchstartProvider.notifier).state = false;
            //             stopTime();
            //           } else {
            //             ref.read(stopwatchstartProvider.notifier).state = true;
            //             startTime();
            //           }
            //           ref.read(stopwatchresetProvider.notifier).state = true;
            //         },
            //         child: Container(
            //           width: 100,
            //           height: 100,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(20),
            //             color: Colors.black,
            //           ),
            //           child: Icon(
            //             color: Colors.white,
            //             pressedStart ? Icons.pause : Icons.play_arrow,
            //           ),
            //         ),
            //       ),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
