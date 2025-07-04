import 'package:flutter_riverpod/flutter_riverpod.dart';

class Incompletereminders extends StateNotifier<List<Map>> {
  Incompletereminders() : super([]);

  void addData(Map data) {
    state = [...state, data];
  }

  void removeData(int id) {
    int index = 0;
    for (Map map in state) {
      if (map['id'] == id) break;
      index++;
    }

    if (index >= 0 && index < state.length) {
      final newList = [...state]..removeAt(index);
      state = newList;
    }
  }

  List getState() {
    return state;
  }

  int length() {
    return state.length;
  }
}

final incompleteremindersProviders =
    StateNotifierProvider<Incompletereminders, List<Map>>((ref) {
      return Incompletereminders();
    });
