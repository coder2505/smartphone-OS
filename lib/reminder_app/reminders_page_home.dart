import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/reminder_app/db/provider_setup.dart';

class RemindersPageHome extends ConsumerStatefulWidget {
  const RemindersPageHome({super.key});

  @override
  ConsumerState<RemindersPageHome> createState() => _RemindersPageHomeState();
}

class _RemindersPageHomeState extends ConsumerState<RemindersPageHome> {
  Set<int> list = {};

  @override
  Widget build(BuildContext context) {
    ref.watch(databaseReminderProvider);

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
              itemCount: ref.read(databaseReminderProvider.notifier).length(),
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
                        value: list.contains(index),
                        activeColor: Colors.blueAccent,
                        onChanged: (bool? value) {
                          if (list.contains(index)) {
                            setState(() {
                              list.remove(index);
                            });
                          } else {
                            setState(() {
                              list.add(index);
                            });
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
                                  databaseReminderProvider,
                                )[index]['Titles'],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ref.read(
                                  databaseReminderProvider,
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
