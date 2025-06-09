import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/reminder_app/riverpod/allReminders.dart';
import 'package:mobile_os_2/reminder_app/riverpod/incompleteReminders.dart';

class OnsubmitNote {
  Future<void> onSubmit(
    String title,
    String notes,
    int id,
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      if (title != '' && notes != '') {
        ref.read(allRemindersProviders.notifier).addData({
          'id': id,
          'Titles': title,
          'Notes': notes,
          'isCompleted': false,
        });

        ref.read(incompleteremindersProviders.notifier).addData({
          'id': id,
          'Titles': title,
          'Notes': notes,
          'isCompleted': false,
        });

        if (context.mounted) Navigator.pop(context);

        await FirebaseFirestore.instance
            .collection('reminders')
            .doc(id.toString())
            .set({
              'id': id,
              'Titles': title,
              'Notes': notes,
              'isCompleted': false,
            });
      } else {
        if (context.mounted) Navigator.pop(context);

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar() // Dismiss any existing snackbar
          ..showSnackBar(
            SnackBar(
              content: Text(
                "Both text fields should be filled ",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.grey,
              duration: Duration(seconds: 4),
            ),
          );
      }
    } catch (e) {
      rethrow;
    }
  }
}
