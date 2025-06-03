import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/app_drawer/app_drawer_home.dart';
import 'package:page_transition/page_transition.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  bool toDisplayIcon = false;
  bool toDisplayLoader = false;

  final loadingValueProvider = StateProvider<double>((ref) {
    return 0;
  });

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 500), () async {
      setState(() {
        toDisplayIcon = true;
      });
    });
    Timer(Duration(milliseconds: 1250), () {
      setState(() {
        toDisplayLoader = true;
      });
      Timer.periodic(Duration(milliseconds: 500), (timer) {
        ref.read(loadingValueProvider.notifier).state += 0.25;

        if (ref.read(loadingValueProvider.notifier).state >= 1) {
          timer.cancel();
          Navigator.push(
            context,
            PageTransition(
              child: AppDrawerHome(),
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeIn,
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(loadingValueProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child:
                  toDisplayIcon
                      ? Image.asset('lib/assets/images/appleicon.png')
                      : null,
            ),
            SizedBox(height: 50),
            AnimatedContainer(
              duration: Duration.zero,
              height: 5,
              width: 200,
              child:
                  toDisplayLoader
                      ? LinearProgressIndicator(
                        value: ref.read(loadingValueProvider),
                        backgroundColor: Colors.grey,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      )
                      : null,
            ),
          ],
        ),
      ),
    );
  }
}
