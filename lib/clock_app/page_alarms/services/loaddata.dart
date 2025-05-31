import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/clock_app/page_alarms/riverpod/alarm_riverpod.dart';

class Loaddata {
  Future<void> loadData(WidgetRef ref) async {
    QuerySnapshot q =
        await FirebaseFirestore.instance.collection("alarms").get();

    for (QueryDocumentSnapshot qd in q.docs) {
      Map dataList = qd.data() as Map;
      ref.read(alarmDataProvider).add(dataList);
    }
  }
}
