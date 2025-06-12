import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/reminder_app/pages/details_page.dart';
import 'package:mobile_os_2/reminder_app/riverpod/small.dart';
import 'package:mobile_os_2/reminder_app/services/onsubmit_note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewReminder {
  void addReminder(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.sizeOf(context).height;

    final TextEditingController titleText = TextEditingController();
    final TextEditingController notes = TextEditingController();
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
                        ref.read(dateProvider.notifier).state = "";
                      },
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
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        int? id = prefs.getInt("reminderId");

                        if (id == null) {
                          prefs.setInt("reminderId", 0);
                        } else {
                          prefs.setInt("reminderId", id + 1);
                        }
                        await OnsubmitNote().onSubmit(
                          titleText.text,
                          notes.text,
                          id ?? 0,
                          context,
                          ref,
                          ref.read(dateProvider.notifier).state,
                        );

                        ref.read(dateProvider.notifier).state = "";
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
                Column(
                  children: [
                    CupertinoTextField(
                      controller: titleText,
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
                      controller: notes,
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
                GestureDetector(
                  onTap: () {
                    DetailsPage().details(context, ref);
                  },
                  child: Consumer(
                    builder: (
                      BuildContext context,
                      WidgetRef ref,
                      Widget? child,
                    ) {
                      ref.watch(dateProvider);
                      return Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Details"),
                                  Text(
                                    ref.read(dateProvider) == ""
                                        ? "None"
                                        : ref.read(dateProvider.notifier).state,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
