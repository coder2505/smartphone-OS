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
  Set selectedItems = {};

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
          bool isSelected = selectedItems.contains(index);
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: GestureDetector(
              onLongPress: () {
                setState(() {
                  if (isSelected) {
                    selectedItems.remove(index);
                  } else {
                    selectedItems.add(index);
                  }
                });
              },

              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),

                height: height * 0.15,
                width: width,

                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? const Color.fromARGB(93, 0, 0, 0)
                          : Color.fromARGB(227, 255, 255, 255),
                  border: Border.all(color: const Color.fromARGB(210, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(93, 0, 0, 0), // shadow color
                      spreadRadius: 2, // how wide the shadow spreads
                      blurRadius: 8, // how blurry the shadow is
                      offset: Offset(0, 4), // position of shadow: (x, y)
                    ),
                  ],
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
                    isSelected
                        ? Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Dbchanges().deleteAlarm(
                                alarmList[index]['id'],
                                index,
                                ref,
                              );
                              selectedItems.remove(index);
                            },
                            child: Icon(
                              Icons.delete,
                              size: 32,
                              color: const Color.fromARGB(255, 188, 0, 0),
                            ),
                          ),
                        )
                        : Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Center(
                                child: Switch(
                                  value: alarmList[index]["isON"],
                                  activeColor: Colors.black,
                                  onChanged: (bool value) {
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
