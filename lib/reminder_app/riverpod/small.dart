import 'package:flutter_riverpod/flutter_riverpod.dart';

final switchForDateProvider = StateProvider<bool>((ref) {
  return false;
});

final containerHeightProvider = StateProvider<double>((ref) {
  return 50;
});

final dateProvider = StateProvider<String>((ref) {
  return "";
});
