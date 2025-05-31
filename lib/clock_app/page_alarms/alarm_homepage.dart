import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/clock_app/page_alarms/DBchanges.dart';
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
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: GestureDetector(
              onLongPress: () {
                

              },

              child: Container(
                height: height * 0.15,
                width: width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(227, 255, 255, 255),
                  border: Border.all(color: const Color.fromARGB(210, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: height * 0.15 - 4,
                      width: width * 0.4,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            alarmList.length > index
                                ? Converttodate().timeStampToTime(
                                  alarmList[index]['TimeStamp'],
                                )
                                : "...",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'CalSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.15 - 4,
                      width: width * 0.3,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          alarmList.length > index
                              ? Converttodate().timeStampToDate(
                                alarmList[index]['TimeStamp'],
                              )
                              : "...",

                          style: TextStyle(fontSize: 18, fontFamily: 'CalSans'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Center(
                            child: Switch(
                              value: alarmList[index]["isON"],
                              activeColor: Colors.black,
                              onChanged: (bool value) {
                                print(index);
                                Dbchanges().changeIsOn(
                                  alarmList[index]['id'],
                                  value,
                                  index,
                                  ref,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 16, 32),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            AlarmSet().showSheet(context, ref);
          },
        ),
      ),
    );
  }
}
