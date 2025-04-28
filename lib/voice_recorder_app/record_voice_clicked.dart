import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/voice_recorder_app/voice_recorder_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class RecordVoiceClicked {
  final record = AudioRecorder();
  final audioplayer = AudioPlayer();

  String recordingPath = "";

  // START VOICE RECORDING
  Future<void> startVoiceRecord(WidgetRef ref) async {
    if (await record.hasPermission()) {
      final dir = await getApplicationDocumentsDirectory();
      final path = Directory("${dir.path}/audio/Manish");

      if (!await path.exists()) {
        await path.create(recursive: true);
      }

      recordingPath = "${path.path}/pls.m4a";
      ref.read(recordingPathProvider.notifier).state = "${path.path}/pls.m4a";

      await record.start(const RecordConfig(), path: recordingPath);
      ref.read(hasClickedPlayProvider.notifier).state = true;
    }
  }

  // STOP VOICE RECORDING
  Future<void> stopVoiceRecord(WidgetRef ref) async {
    await record.stop();
    ref.read(hasClickedPlayProvider.notifier).state = false;
  }
}
