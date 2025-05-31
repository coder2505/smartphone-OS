import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/clock_app/page_alarms/alarm_set.dart';
import 'package:mobile_os_2/clock_app/page_alarms/riverpod/alarm_riverpod.dart';
import 'package:mobile_os_2/clock_app/page_alarms/services/converttodate.dart';

class AlarmHomepage extends ConsumerStatefulWidget {
  const AlarmHomepage({super.key});

  @override
  ConsumerState<AlarmHomepage> createState() => _AlarmHomepageState();
}

class _AlarmHomepageState extends ConsumerState<AlarmHomepage> {
  List? timeStamp;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    final alarmList = ref.watch(alarmDataProvider);

    return Scaffold(
      body: ListView.builder(
        itemCount: alarmList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height * 0.15,
              width: width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: height * 0.15 - 4,
                    width: width * 0.4,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        alarmList.length > index
                            ? Converttodate().timeStampToTime(
                              alarmList[index]['TimeStamp'],
                            )
                            : "...",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.15 - 4,
                    width: width * 0.3,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        alarmList.length > index
                            ? Converttodate().timeStampToDate(
                              alarmList[index]['TimeStamp'],
                            )
                            : "...",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Center(child: Text("3:30 pm")),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 16, 32),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            AlarmSet().showSheet(context, ref);
          },
        ),
      ),
    );
  }
}
