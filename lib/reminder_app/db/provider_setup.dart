import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderSetup extends StateNotifier<List<Map>> {
  ProviderSetup() : super([]);

  void addData(Map data) {
    state = [...state, data];
  }

  List getState() {
    return state;
  }

  int length() {
    return state.length;
  }
}

final databaseReminderProvider =
    StateNotifierProvider<ProviderSetup, List<Map>>((ref) {
      return ProviderSetup();
    });
