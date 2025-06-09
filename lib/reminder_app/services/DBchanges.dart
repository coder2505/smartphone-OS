import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/reminder_app/riverpod/allReminders.dart';
import 'package:mobile_os_2/reminder_app/riverpod/completedReminders.dart';
import 'package:mobile_os_2/reminder_app/riverpod/incompleteReminders.dart';
import 'package:mobile_os_2/reminder_app/riverpod/provider_not_for_db.dart';

class DbChangesReminder {
  Future<void> isCompleted(int index, int id, bool value, WidgetRef ref) async {
    try {
      if (!value) {
        ref
            .read(completedRemindersProvider.notifier)
            .addData(ref.read(allRemindersProviders)[index]);

        ref.read(checkboxProvider.notifier).add(index);
        Timer(const Duration(seconds: 2), () {
          ref.read(allRemindersProviders.notifier).hasCompleted(true, id);
          ref.read(checkboxProvider.notifier).remove(index);
          ref.read(incompleteremindersProviders.notifier).removeData(id);
        });
        await FirebaseFirestore.instance
            .collection("reminders")
            .doc(id.toString())
            .update({'isCompleted': true});
      } else {
        ref.read(checkboxProvider.notifier).remove(index);
      }
    } catch (e) {
      rethrow;
    }
  }
}
