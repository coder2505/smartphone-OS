import 'package:flutter_riverpod/flutter_riverpod.dart';

final hasClickedPlayProvider = StateProvider<bool>((ref) {
  return false;
});

final recordingPathProvider = StateProvider<String>((ref) {
  return "";
});
