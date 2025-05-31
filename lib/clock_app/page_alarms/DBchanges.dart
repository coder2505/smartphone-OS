import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/clock_app/page_alarms/riverpod/alarm_riverpod.dart';

class Dbchanges {
  Future<void> saveAlarm(int id, DateTime time, WidgetRef ref) async {
    try {
      await FirebaseFirestore.instance
          .collection("alarms")
          .doc(id.toString())
          .set({"TimeStamp": Timestamp.fromDate(time), "isON": true, "id": id});

      ref.read(alarmDataProvider.notifier).addData({
        "TimeStamp": Timestamp.fromDate(time),
        "isON": true,
        "id": id,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> changeIsOn(int id, bool val, int index, WidgetRef ref) async {
    try {
      ref.read(alarmDataProvider.notifier).updateisON(val, index);

      Map<String, bool> updatedField = {"isON": val};
      await FirebaseFirestore.instance
          .collection("alarms")
          .doc(id.toString())
          .update(updatedField);
    } catch (e) {
      rethrow;
    }
  }
}
