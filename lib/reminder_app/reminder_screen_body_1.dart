import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/reminder_app/pages/allreminders_page.dart';
import 'package:mobile_os_2/reminder_app/pages/completed_page.dart';
import 'package:mobile_os_2/reminder_app/riverpod/allReminders.dart';
import 'package:mobile_os_2/reminder_app/pages/reminders_page.dart';
import 'package:mobile_os_2/reminder_app/riverpod/completedReminders.dart';
import 'package:mobile_os_2/reminder_app/riverpod/incompleteReminders.dart';
import 'package:page_transition/page_transition.dart';

class ReminderHomeBody extends ConsumerStatefulWidget {
  const ReminderHomeBody({super.key});

  @override
  ConsumerState<ReminderHomeBody> createState() => _ReminderHomeBodyState();
}

class _ReminderHomeBodyState extends ConsumerState<ReminderHomeBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    ref.watch(allRemindersProviders);
    ref.watch(completedRemindersProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 244, 244),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 70),
            CupertinoSearchTextField(prefixIcon: Icon(Icons.search)),
            SizedBox(height: 16),
            Row(
              spacing: 10,
              children: [
                Container(
                  width: width / 2.25,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 75,
                              child: Center(
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(Icons.calendar_today),
                                ),
                              ),
                            ),
                            Text("Today"),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "0",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width / 2.25,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 75,
                              child: Center(
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(Icons.calendar_month),
                                ),
                              ),
                            ),
                            Text("Scheduled"),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "0",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              spacing: 10,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: AllremindersPage(),
                        type: PageTransitionType.rightToLeft,
                        curve: Curves.easeIn,
                      ),
                    );
                  },
                  child: Container(
                    width: width / 2.25,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 75,
                                child: Center(
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(
                                      Icons.inbox,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Text("All"),
                            ],
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  ref
                                      .read(allRemindersProviders.notifier)
                                      .length()
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: CompletedPage(),
                        type: PageTransitionType.rightToLeft,
                        curve: Curves.easeIn,
                      ),
                    );
                  },
                  child: Container(
                    width: width / 2.25,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 75,
                                child: Center(
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(Icons.check),
                                  ),
                                ),
                              ),
                              Text("Completed"),
                            ],
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  ref
                                      .read(completedRemindersProvider.notifier)
                                      .length()
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: RemindersPageHome(),
                    type: PageTransitionType.rightToLeft,
                    curve: Curves.easeIn,
                  ),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 4, 16, 4),
                  child: Row(
                    spacing: 10,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.list_rounded, color: Colors.white),
                      ),
                      Text("Reminders"),
                      Expanded(child: SizedBox()),
                      Row(
                        spacing: 10,
                        children: [
                          Text(
                            ref
                                .read(incompleteremindersProviders.notifier)
                                .length()
                                .toString(),
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
