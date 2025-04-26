import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/voice_recorder_app/record_voice_clicked.dart';
import 'package:mobile_os_2/voice_recorder_app/voice_recorder_riverpod.dart';

class VoiceRecorderHomeScreen extends ConsumerStatefulWidget {
  const VoiceRecorderHomeScreen({super.key});

  @override
  ConsumerState<VoiceRecorderHomeScreen> createState() =>
      _VoiceRecorderHomeScreenState();
}

class _VoiceRecorderHomeScreenState
    extends ConsumerState<VoiceRecorderHomeScreen> {
  @override
  Widget build(BuildContext context) {
    ref.watch(hasClickedPlayProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Voice Recorder')),
      body: Center(
        child: IconButton(
          onPressed: () {
            ref.read(hasClickedPlayProvider.notifier).state
                ? RecordVoiceClicked().stopVoiceRecord(ref)
                : RecordVoiceClicked().startVoiceRecord(ref);
          },
          icon:
              ref.read(hasClickedPlayProvider.notifier).state
                  ? Icon(Icons.pause)
                  : Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
