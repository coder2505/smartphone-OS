import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/reminder_app/db/provider_setup.dart';

class Loaddatareminder {
  Future<void> loadData(WidgetRef ref) async {
    QuerySnapshot qs =
        await FirebaseFirestore.instance.collection('reminders').get();

    for (QueryDocumentSnapshot qd in qs.docs) {
      Map data = qd.data() as Map;
      ref.read(databaseReminderProvider.notifier).addData(data);
    }
  }
}
