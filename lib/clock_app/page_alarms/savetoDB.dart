import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/clock_app/page_alarms/riverpod/alarm_riverpod.dart';

class Savetodb {
  Future<void> saveAlarm(int id, DateTime time, WidgetRef ref) async {
    try {
      await FirebaseFirestore.instance
          .collection("alarms")
          .doc(id.toString())
          .set({"TimeStamp": Timestamp.fromDate(time), "isON": true});

      ref.read(alarmDataProvider.notifier).addData({
        "TimeStamp": Timestamp.fromDate(time),
        "isON": true,
      });
    } catch (e) {
      rethrow;
    }
  }
}
