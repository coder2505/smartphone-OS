import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavBarSelected = StateProvider<int>((ref) {
  return 1;
});

final stopwatchstartProvider = StateProvider<bool>((ref) {
  return false;
});

final stopwatchresetProvider = StateProvider<bool>((ref) {
  return false;
});

final timeProvider = StateProvider<String>((ref) {
  return '00:00:00';
});
