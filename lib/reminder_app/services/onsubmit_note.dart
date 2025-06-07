import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OnsubmitNote {
  Future<void> onSubmit(
    String title,
    String notes,
    int id,
    BuildContext context,
  ) async {
    try {
      if (title != '' && notes != '') {
        await FirebaseFirestore.instance
            .collection('reminders')
            .doc(id.toString())
            .set({'id': id, 'Titles': title, 'Notes': notes});

        if (context.mounted) Navigator.pop(context);
      } else {
        if (context.mounted) Navigator.pop(context);

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar() // Dismiss any existing snackbar
          ..showSnackBar(
            SnackBar(
              content: Text(
                "Both text fields should be filled ",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.grey,
              duration: Duration(seconds: 4),
            ),
          );
      }
    } catch (e) {
      rethrow;
    }
  }
}
