import 'package:flutter_riverpod/flutter_riverpod.dart';

class checkbox extends StateNotifier<Set<int>> {
  checkbox() : super({});

  Set getSet() {
    return state;
  }

  void add(int value) {
    state = {...state, value};
  }

  void remove(int value) {
    state = {...state}..remove(value);
  }
}

final checkboxProvider = StateNotifierProvider<checkbox, Set<int>>((ref) {
  return checkbox();
});
