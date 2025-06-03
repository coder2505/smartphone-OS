import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mobile_os_2/calendar_app/calendar_home.dart';

class CalendarAppIcon extends StatefulWidget {
  const CalendarAppIcon({super.key});

  @override
  State<CalendarAppIcon> createState() => _CalendarAppIconState();
}

class _CalendarAppIconState extends State<CalendarAppIcon> {
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
          child: Icon(Icons.numbers, color: Colors.red, size: 30),
        );
      },
      openBuilder: (
        BuildContext context,
        void Function({Object? returnValue}) action,
      ) {
        return CalendarHome();
      },
    );
  }
}
