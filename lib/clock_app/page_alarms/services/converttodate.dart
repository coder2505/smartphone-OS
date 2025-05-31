import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Converttodate {
  String date(Timestamp timestamp) {
    return timestamp.toDate().toString();
  }

  String timeStampToTime(Timestamp timestamp) {
    String ampm = " am";

    String hour = timestamp.toDate().toString().substring(10, 13);
    String minutes = timestamp.toDate().toString().substring(13, 16);
    int temp = int.parse(hour);

    if (temp > 12) {
      hour = (temp - 12).toString();

      ampm = " pm";
    }

    return hour + minutes + ampm;
  }

  String timeStampToDate(Timestamp timestamp) {
    String date = timestamp.toDate().toString().substring(0, 11).trim();
    DateTime dt = DateTime.parse(date);

    return DateFormat('d MMMM').format(dt);
  }
}
