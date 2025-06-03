import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarHome extends StatefulWidget {
  const CalendarHome({super.key});

  @override
  State<CalendarHome> createState() => _CalendarHomeState();
}

class _CalendarHomeState extends State<CalendarHome> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(1971, 1, 1),
            lastDay: DateTime.utc(2999, 12, 31),
          ),
        ],
      ),
    );
  }
}
