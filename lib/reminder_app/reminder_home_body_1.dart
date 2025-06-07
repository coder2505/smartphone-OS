import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReminderHomeBody extends StatefulWidget {
  const ReminderHomeBody({super.key});

  @override
  State<ReminderHomeBody> createState() => _ReminderHomeBodyState();
}

class _ReminderHomeBodyState extends State<ReminderHomeBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

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
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(Icons.inbox, color: Colors.white),
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
            SizedBox(height: 32),
            Container(
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
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        spacing: 10,
                        children: [
                          Text("1", style: TextStyle(color: Colors.grey)),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
