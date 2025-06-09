import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/reminder_app/riverpod/incompleteReminders.dart';
import 'package:mobile_os_2/reminder_app/riverpod/provider_not_for_db.dart';
import 'package:mobile_os_2/reminder_app/riverpod/allReminders.dart';
import 'package:mobile_os_2/reminder_app/services/DBchanges.dart';

class RemindersPageHome extends ConsumerStatefulWidget {
  const RemindersPageHome({super.key});

  @override
  ConsumerState<RemindersPageHome> createState() => _RemindersPageHomeState();
}

class _RemindersPageHomeState extends ConsumerState<RemindersPageHome> {
  Set<int> list = {};

  @override
  Widget build(BuildContext context) {
    ref.watch(allRemindersProviders);
    ref.watch(checkboxProvider);
    ref.watch(incompleteremindersProviders);

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
              itemCount:
                  ref.read(incompleteremindersProviders.notifier).length(),
              itemBuilder: (BuildContext context, int index) {
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

                        value: set.contains(index),

                        activeColor: Colors.blueAccent,
                        onChanged: (bool? value) async {
                          int id =
                              ref.read(
                                incompleteremindersProviders,
                              )[index]['id'];
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
                                  incompleteremindersProviders,
                                )[index]['Titles'],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ref.read(
                                  incompleteremindersProviders,
                                )[index]['Notes'],
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
