import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_os_2/clock_app/page_alarms/savetoDB.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmSet {
  void showSheet(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: height * 0.5,
          width: width,
          child: BottomPicker.dateTime(
            pickerTitle: Align(
              alignment: Alignment.center,
              child: Text(
                "Pick a Time",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PlayfairDisplay',
                ),
              ),
            ),
            titleAlignment: Alignment.center,
            buttonSingleColor: Colors.black,
            dateOrder: DatePickerDateOrder.dmy,
            pickerTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: 'PlayfairDisplay',
            ),
            onSubmit: (date) async {
              DateTime dateTime = DateTime.parse(date.toString());
              String alarmPath = 'lib/assets/alarm_sound/alarm.mp3';

              SharedPreferences prefs = await SharedPreferences.getInstance();
              int? id = prefs.getInt("alarmId");

              if (id == null) {
                prefs.setInt("alarmId", 0);
              } else {
                prefs.setInt("alarmId", id + 1);
              }

              await Savetodb().saveAlarm(id ?? 0, dateTime, ref);
              setalarm(id ?? 0, dateTime, alarmPath);
            },
          ),
        );
      },
    );
  }

  Future<void> setalarm(int id, DateTime dateTime, String alarmPath) async {
    final alarmSettings = AlarmSettings(
      id: id,
      dateTime: dateTime,
      assetAudioPath: alarmPath,
      loopAudio: true,
      vibrate: true,
      warningNotificationOnKill: Platform.isIOS,
      androidFullScreenIntent: true,
      volumeSettings: VolumeSettings.fade(
        volume: 0.8,
        fadeDuration: Duration(seconds: 20),
        volumeEnforced: true,
      ),
      notificationSettings: const NotificationSettings(
        title: 'This is the title',
        body: 'This is the body',
        stopButton: 'Stop the alarm',
        icon: 'notification_icon',
        iconColor: Color(0xff862778),
      ),
    );

    await Alarm.set(alarmSettings: alarmSettings);
  }
}
