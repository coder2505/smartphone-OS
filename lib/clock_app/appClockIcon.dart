import 'package:flutter/material.dart';
import 'package:mobile_os_2/clock_app/appClockHome.dart';
import 'package:page_transition/page_transition.dart';

class Appclockicon extends StatefulWidget {
  const Appclockicon({super.key});

  @override
  State<Appclockicon> createState() => _AppclockiconState();
}

class _AppclockiconState extends State<Appclockicon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(child: Appclockhome(), type: PageTransitionType.fade),
        );
      },

      child: Container(
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(Icons.alarm, color: Colors.white, size: 30),
      ),
    );
  }
}
