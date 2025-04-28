import 'package:flutter/material.dart';
import 'package:mobile_os_2/assets/utils/appicon.dart';
import 'package:mobile_os_2/clock_app/appClockIcon.dart';

class AppDrawerHome extends StatefulWidget {
  const AppDrawerHome({super.key});

  @override
  State<AppDrawerHome> createState() => _AppDrawerHomeState();
}

class _AppDrawerHomeState extends State<AppDrawerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(72, 79, 110, 126),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 25,
          ),
          children: [Appicon().appIconVoiceRecorder(context), Appclockicon()],
        ),
      ),
    );
  }
}
