import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/voice_recorder_app/voice_recorder_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class RecordVoiceClicked {
  final record = AudioRecorder();

  // START VOICE RECORDING
  Future<void> startVoiceRecord(WidgetRef ref) async {
    if (await record.hasPermission()) {
      final dir = await getApplicationDocumentsDirectory();
      final pathstr = "$dir/audio/Manish/pls";
      record.start(const RecordConfig(), path: pathstr);

      ref.read(hasClickedPlayProvider.notifier).state = true;
    }
  }

  //STOP VOICE RECORDING
  Future<void> stopVoiceRecord(WidgetRef ref) async {
    record.stop();
    ref.read(hasClickedPlayProvider.notifier).state = false;
  }
}
