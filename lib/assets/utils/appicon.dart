import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_os_2/voice_recorder_app/voice_recorder_home_screen.dart';
import 'package:page_transition/page_transition.dart';

class Appicon {
  Widget appIconVoiceRecorder(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (context.mounted) {
          Navigator.push(
            context,
            PageTransition(
              child: VoiceRecorderHomeScreen(),
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            ),
          );
        }
      },
      child: Container(
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 182, 214, 246),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset('lib/assets/images/voicerecordericon.png'),
      ),
    );
  }
}
