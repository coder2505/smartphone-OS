import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/reminder_app/riverpod/small.dart';
import 'package:mobile_os_2/reminder_app/table_calendar.dart';

class DetailsPage {
  void details(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.sizeOf(context).height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: height * 0.9,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
            child: Column(
              spacing: 20,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "New Reminder",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Center(
                          child: Text(
                            "Details",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Add",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                Consumer(
                  builder: (context, ref, child) {
                    ref.watch(switchForDateProvider);
                    ref.watch(containerHeightProvider);
                    ref.watch(dateProvider);

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      height: ref.read(containerHeightProvider),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color.fromARGB(
                                      255,
                                      239,
                                      32,
                                      17,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.calendar_month_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Date"),
                                    AnimatedOpacity(
                                      opacity:
                                          ref.read(switchForDateProvider)
                                              ? 1
                                              : 0,
                                      duration: const Duration(
                                        milliseconds: 500,
                                      ),
                                      child:
                                          ref.read(switchForDateProvider)
                                              ? Text(
                                                ref
                                                    .read(dateProvider.notifier)
                                                    .state,
                                                style: TextStyle(
                                                  color: Colors.blueAccent,
                                                ),
                                              )
                                              : SizedBox.shrink(),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                Switch(
                                  value: ref.read(switchForDateProvider),
                                  activeColor: Colors.green,
                                  onChanged: (bool value) {
                                    ref
                                        .read(switchForDateProvider.notifier)
                                        .state = value;
                                    if (value) {
                                      ref
                                          .read(
                                            containerHeightProvider.notifier,
                                          )
                                          .state = 410;
                                    } else {
                                      ref
                                          .read(
                                            containerHeightProvider.notifier,
                                          )
                                          .state = 50;
                                    }
                                  },
                                ),
                              ],
                            ),

                            ref.read(switchForDateProvider)
                                ? Expanded(child: TableCalendarr())
                                : SizedBox(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
