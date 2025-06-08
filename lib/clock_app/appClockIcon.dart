import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mobile_os_2/clock_app/appClockHome.dart';

class Appclockicon extends StatefulWidget {
  const Appclockicon({super.key});

  @override
  State<Appclockicon> createState() => _AppclockiconState();
}

class _AppclockiconState extends State<Appclockicon> {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      closedBuilder: (BuildContext context, void Function() action) {
        return SizedBox(
          height: 75,
          width: 75,
          child: Icon(Icons.alarm, color: Colors.black, size: 30),
        );
      },
      openBuilder: (
        BuildContext context,
        void Function({Object? returnValue}) action,
      ) {
        return Appclockhome();
      },
    );
  }
}
