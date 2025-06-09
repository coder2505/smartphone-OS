import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderSetup extends StateNotifier<List<Map>> {
  ProviderSetup() : super([]);

  void addData(Map data) {
    state = [...state, data];
  }

  void hasCompleted(bool val, int index) {
    final updatedList = List<Map>.from(state);

    updatedList[index] = Map<String, dynamic>.from(updatedList[index]);
    updatedList[index]['isCompleted'] = val;
    state = updatedList;
  }

  List getState() {
    return state;
  }

  int length() {
    return state.length;
  }
}

final allRemindersProviders = StateNotifierProvider<ProviderSetup, List<Map>>((
  ref,
) {
  return ProviderSetup();
});
