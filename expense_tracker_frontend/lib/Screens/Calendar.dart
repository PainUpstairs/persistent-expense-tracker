import 'package:flutter/cupertino.dart';
import 'package:expense_tracker_frontend/Util/Styling.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Widget textForBody(String text) {
    return Text(text, style: Styling().themedata.textTheme.bodyLarge);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
    ));
  }
}


