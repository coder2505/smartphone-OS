import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/reminder_app/add_new_reminder.dart';
import 'package:mobile_os_2/reminder_app/reminder_home_body_1.dart';

class ReminderAppHome extends ConsumerStatefulWidget {
  const ReminderAppHome({super.key});

  @override
  ConsumerState<ReminderAppHome> createState() => _ReminderAppHomeState();
}

class _ReminderAppHomeState extends ConsumerState<ReminderAppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReminderHomeBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                AddNewReminder().addReminder(context, ref);
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
