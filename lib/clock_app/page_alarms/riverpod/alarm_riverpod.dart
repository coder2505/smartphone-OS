import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlarmRiverpod extends StateNotifier<List<Map>> {
  AlarmRiverpod() : super([]);

  void addData(Map data) {
    state = [...state, data];
  }

  void updateisON(bool val, int index) {
    final updatedList = List<Map>.from(state);

    updatedList[index] = Map<String, dynamic>.from(updatedList[index]);
    updatedList[index]['isON'] = val;
    state = updatedList;
  }

  void deleteAlarm(int index) {
    final updatedList = List<Map>.from(state);
    updatedList.removeAt(index);
    state = updatedList;
  }
}

final alarmDataProvider = StateNotifierProvider<AlarmRiverpod, List<Map>>((
  ref,
) {
  return AlarmRiverpod();
});
