import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlarmRiverpod extends StateNotifier<List<Map>> {
  AlarmRiverpod() : super([]);

  void addData(Map data) {
    state = [...state, data];
  }
}

final alarmDataProvider = StateNotifierProvider<AlarmRiverpod, List<Map>>((
  ref,
) {
  return AlarmRiverpod();
});
