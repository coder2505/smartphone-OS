import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/clock_app/clock_app_riverpod.dart';
import 'package:mobile_os_2/clock_app/page_clock/clock_page.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Appclockhome extends ConsumerStatefulWidget {
  const Appclockhome({super.key});

  @override
  ConsumerState<Appclockhome> createState() => _AppclockhomeState();
}

class _AppclockhomeState extends ConsumerState<Appclockhome> {
  int selected = 1;

  List pages = [
    Center(child: Text("1")),
    Center(child: ClockPage()),
    Center(child: Text("3")),
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
          BottomBarItem(icon: Icon(Icons.alarm), title: Text("Alarm")),
          BottomBarItem(icon: Icon(Icons.watch), title: Text("Clock")),
          BottomBarItem(icon: Icon(Icons.timer), title: Text("Stopwatch")),
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
