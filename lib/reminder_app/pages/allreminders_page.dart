import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/reminder_app/riverpod/allReminders.dart';
import 'package:mobile_os_2/reminder_app/riverpod/provider_not_for_db.dart';
import 'package:mobile_os_2/reminder_app/services/DBchanges.dart';

class AllremindersPage extends ConsumerStatefulWidget {
  const AllremindersPage({super.key});

  @override
  ConsumerState<AllremindersPage> createState() => _AllremindersPageState();
}

class _AllremindersPageState extends ConsumerState<AllremindersPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(allRemindersProviders);
    ref.watch(checkboxProvider);

    Set set = ref.read(checkboxProvider.notifier).getSet();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              "Reminders",
              style: TextStyle(color: Colors.blueAccent, fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ref.read(allRemindersProviders.notifier).length(),
              itemBuilder: (BuildContext context, int index) {
                print(ref.read(allRemindersProviders)[index]['isCompleted']);
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: const Color.fromARGB(255, 183, 183, 183),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),

                        value:
                            ref.read(
                                  allRemindersProviders,
                                )[index]['isCompleted']
                                ? true
                                : set.contains(index),

                        activeColor:
                            ref.read(
                                  allRemindersProviders,
                                )[index]['isCompleted']
                                ? Colors.grey
                                : Colors.blueAccent,
                        onChanged: (bool? value) async {
                          int id = ref.read(allRemindersProviders)[index]['id'];
                          ref.read(checkboxProvider.notifier).add(index);
                          if (set.contains(index)) {
                            DbChangesReminder().isCompleted(
                              index,
                              id,
                              true,
                              ref,
                            );
                          } else {
                            DbChangesReminder().isCompleted(
                              index,
                              id,
                              false,
                              ref,
                            );
                          }
                        },
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ref.read(
                                  allRemindersProviders,
                                )[index]['Titles'],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ref.read(allRemindersProviders)[index]['Notes'],
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
