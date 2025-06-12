import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobile_os_2/reminder_app/riverpod/small.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarr extends ConsumerStatefulWidget {
  const TableCalendarr({super.key});

  @override
  ConsumerState<TableCalendarr> createState() => _TableCalendarrState();
}

class _TableCalendarrState extends ConsumerState<TableCalendarr> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: dateTime,
        selectedDayPredicate: (day) => isSameDay(day, dateTime),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            dateTime = selectedDay;
          });
          ref.read(dateProvider.notifier).state = DateFormat(
            'd MMMM, y',
          ).format(dateTime);
        },
      ),
    );
  }
}
