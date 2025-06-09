import 'package:flutter_riverpod/flutter_riverpod.dart';

class Completedreminders extends StateNotifier<List<Map>> {
  Completedreminders() : super([]);

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

final completedRemindersProvider =
    StateNotifierProvider<Completedreminders, List<Map>>((ref) {
      return Completedreminders();
    });
