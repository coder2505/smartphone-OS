import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/reminder_app/riverpod/completedReminders.dart';
import 'package:mobile_os_2/reminder_app/riverpod/incompleteReminders.dart';
import 'package:mobile_os_2/reminder_app/riverpod/provider_not_for_db.dart';
import 'package:mobile_os_2/reminder_app/riverpod/allReminders.dart';

class Loaddatareminder {
  Future<void> loadData(WidgetRef ref) async {
    QuerySnapshot qs =
        await FirebaseFirestore.instance.collection('reminders').get();
    // int index = 0;
    for (QueryDocumentSnapshot qd in qs.docs) {
      Map data = qd.data() as Map;
      ref.read(allRemindersProviders.notifier).addData(data);
      if (data['isCompleted']) {
        ref.read(completedRemindersProvider.notifier).addData(data);
        // ref.read(checkboxProvider.notifier).add(index);
      } else {
        ref.read(incompleteremindersProviders.notifier).addData(data);
      }

      // index++;
    }
  }
}
