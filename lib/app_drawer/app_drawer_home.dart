import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/assets/utils/appicon.dart';
import 'package:mobile_os_2/reminder_app/db/loadDataReminder.dart';
import 'package:mobile_os_2/reminder_app/reminder_app_icon.dart';
import 'package:mobile_os_2/clock_app/appClockIcon.dart';
import 'package:mobile_os_2/clock_app/page_alarms/services/loaddata.dart';

class AppDrawerHome extends ConsumerStatefulWidget {
  const AppDrawerHome({super.key});

  @override
  ConsumerState<AppDrawerHome> createState() => _AppDrawerHomeState();
}

class _AppDrawerHomeState extends ConsumerState<AppDrawerHome> {
  @override
  void initState() {
    super.initState();
    Loaddata().loadData(ref);
    Loaddatareminder().loadData(ref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/wallpaper.jpeg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 25,
            ),
            children: [
              Appicon().appIconVoiceRecorder(context),
              Appclockicon(),
              ReminderAppIcon(),
            ],
          ),
        ),
      ),
    );
  }
}
