import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/reminder_app/riverpod/provider_not_for_db.dart';
import 'package:mobile_os_2/reminder_app/riverpod/provider_setup.dart';

class Loaddatareminder {
  Future<void> loadData(WidgetRef ref) async {
    QuerySnapshot qs =
        await FirebaseFirestore.instance.collection('reminders').get();
    int index = 0;
    for (QueryDocumentSnapshot qd in qs.docs) {
      Map data = qd.data() as Map;
      ref.read(databaseReminderProvider.notifier).addData(data);
      if (data['isCompleted']) {
        ref.read(checkboxProvider.notifier).add(index);
      }

      index++;
    }
  }
}
