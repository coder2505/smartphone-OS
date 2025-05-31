import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/clock_app/clock_app_riverpod.dart';
import 'package:mobile_os_2/clock_app/page_alarms/alarm_homepage.dart';
import 'package:mobile_os_2/clock_app/page_clock/clock_page.dart';
import 'package:mobile_os_2/clock_app/page_stopwatch/stopwatch_page.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Appclockhome extends ConsumerStatefulWidget {
  const Appclockhome({super.key});

  @override
  ConsumerState<Appclockhome> createState() => _AppclockhomeState();
}

class _AppclockhomeState extends ConsumerState<Appclockhome> {
  int selected = 1;

  List pages = [
    Center(child: AlarmHomepage()),
    Center(child: ClockPage()),
    Center(child: StopwatchPage()),
  ];

  @override
  Widget build(BuildContext context) {
    ref.watch(bottomNavBarSelected);
    selected = ref.read(bottomNavBarSelected.notifier).state;
    return Scaffold(
      appBar: AppBar(),

      body: pages[selected],

      bottomNavigationBar: StylishBottomBar(
        backgroundColor: Colors.transparent,
        items: [
          BottomBarItem(
            icon: Icon(Icons.alarm, color: Colors.black),
            title: Text("Alarm"),
            selectedColor: Colors.black,
          ),
          BottomBarItem(
            icon: Icon(Icons.watch, color: Colors.black),
            title: Text("Clock"),
            selectedColor: Colors.black,
          ),
          BottomBarItem(
            icon: Icon(Icons.timer_outlined, color: Colors.black),
            title: Text("Stopwatch"),
            selectedColor: Colors.black,
          ),
        ],
        option: AnimatedBarOptions(
          barAnimation: BarAnimation.blink,
          iconStyle: IconStyle.animated,
        ),

        currentIndex: selected,
        onTap: (index) {
          ref.read(bottomNavBarSelected.notifier).state = index;
        },
      ),
    );
  }
}
