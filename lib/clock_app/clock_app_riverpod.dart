import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavBarSelected = StateProvider<int>((ref) {
  return 1;
});

final stopwatchstartProvider = StateProvider<bool>((ref) {
  return false;
});

final timeHoursProvider = StateProvider<String>((ref) {
  return '00';
});
final timeMinutesProvider = StateProvider<String>((ref) {
  return '00';
});
final timeSecondsProvider = StateProvider<String>((ref) {
  return '00';
});
final timeMilliSecondsProvider = StateProvider<String>((ref) {
  return '00';
});
