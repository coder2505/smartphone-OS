import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/reminder_app/riverpod/provider_not_for_db.dart';

class DbChangesReminder {
  Future<void> isCompleted(int index, int id, bool value, WidgetRef ref) async {
    try {
      if (!value) {
        ref.read(checkboxProvider.notifier).add(index);
      } else {
        ref.read(checkboxProvider.notifier).remove(index);
      }
      print(id);
      await FirebaseFirestore.instance
          .collection("reminders")
          .doc(id.toString())
          .update({'isCompleted': !value});
    } catch (e) {
      rethrow;
    }
  }
}
