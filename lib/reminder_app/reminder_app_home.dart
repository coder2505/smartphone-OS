import 'package:flutter/material.dart';
import 'package:mobile_os_2/reminder_app/add_new_reminder.dart';

class ReminderAppHome extends StatefulWidget {
  const ReminderAppHome({super.key});

  @override
  State<ReminderAppHome> createState() => _ReminderAppHomeState();
}

class _ReminderAppHomeState extends State<ReminderAppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                AddNewReminder().addReminder(context);
              },
              child: Row(
                spacing: 10,
                children: [
                  Icon(Icons.add_outlined, color: Colors.blue),
                  Text("New Reminder"),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            GestureDetector(onTap: () {}, child: Text("Add List")),
          ],
        ),
      ),
    );
  }
}
