import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewReminder {
  void addReminder(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: height * 0.9,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),

            child: Column(
              spacing: 20,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Cancel",
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
                            "New Reminder",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
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
                Column(
                  children: [
                    CupertinoTextField(
                      padding: EdgeInsetsGeometry.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                      child: Divider(
                        indent: 0,
                        height: 0,
                        color: Colors.grey,
                        thickness: 0,
                      ),
                    ),
                    CupertinoTextField(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 50,
                        horizontal: 12,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text("Details"),
                        Expanded(child: SizedBox()),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
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
                        Text("List"),
                        Expanded(child: SizedBox()),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            spacing: 10,
                            children: [
                              Text(
                                "Reminders",
                                style: TextStyle(color: Colors.grey),
                              ),
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
      },
    );
  }
}
