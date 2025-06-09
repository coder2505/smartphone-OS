import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/reminder_app/riverpod/completedReminders.dart';

class CompletedPage extends ConsumerStatefulWidget {
  const CompletedPage({super.key});

  @override
  ConsumerState<CompletedPage> createState() => _CompletedPageState();
}

class _CompletedPageState extends ConsumerState<CompletedPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(completedRemindersProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              "Completed",
              style: TextStyle(color: Colors.blueGrey, fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ref.read(completedRemindersProvider.notifier).length(),
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

                        value: true,

                        activeColor: Colors.grey,
                        onChanged: (bool? value) {},
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ref.read(
                                  completedRemindersProvider,
                                )[index]['Titles'],
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 59, 59, 59),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ref.read(
                                  completedRemindersProvider,
                                )[index]['Notes'],
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    115,
                                    115,
                                    115,
                                  ),
                                ),
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
