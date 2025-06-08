import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mobile_os_2/reminder_app/reminder_screen_home.dart';

class ReminderAppIcon extends StatefulWidget {
  const ReminderAppIcon({super.key});

  @override
  State<ReminderAppIcon> createState() => _ReminderAppIconState();
}

class _ReminderAppIconState extends State<ReminderAppIcon> {
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
        return ReminderAppHome();
      },
    );
  }
}
