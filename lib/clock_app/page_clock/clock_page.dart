import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    AnalogClock clock = AnalogClock.dark(
      hourNumbers: [],
      hourHandColor: Colors.white,
      secondHandColor: Colors.white,
      minuteHandColor: Colors.white,
      hourHandWidthFactor: 0.5,
      minuteHandWidthFactor: 0.5,
      secondHandWidthFactor: 1,
      secondHandLengthFactor: 0.65,
      minuteHandLengthFactor: 0.75,
      centerPointColor: Colors.white,
      centerPointWidthFactor: 0.5,
      markingWidthFactor: 0,
    );

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on_rounded),
                  SizedBox(width: 10),
                  Text(
                    "India",
                    style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Monday, 28 April 2025",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 92, 92, 92),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PlayfairDisplay',
                    ),
                  ),
                  Text(
                    "10:08 PM",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'CalSans',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: height * 0.1),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(123, 0, 0, 0),
                  spreadRadius: 10,
                  blurRadius: 100,
                  // offset: Offset(0, 1),
                ),
              ],
            ),
            height: height * 0.3,
            child: clock,
          ),

          Expanded(
            child: Center(
              child: Text(
                "Good Evening",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PlayfairDisplay',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
