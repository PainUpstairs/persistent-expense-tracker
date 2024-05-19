import 'package:expense_tracker_frontend/Util/Styling.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Widget textForBody(String text) {
    return Text(text, style: Styling().themedata.textTheme.bodyLarge);
  }

  final monthNames = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<Widget> calendarBody() {
    List<Widget> monthArr = [];
    var year = 2024;
    var month = 4;
    var date = DateTime.utc(year, month);
    int offSet = date.weekday;
    var nextMonth = DateTime.utc(year, month + 1);
    nextMonth = nextMonth.add(const Duration(days: -1));
    int lastDayOfMonth = nextMonth.day;

    for (int w = 0; w < 5; w++) {
      List<Widget> week = [];
      for (int d = 1; d < 8; d++) {
        int temp = w * 7 + d - offSet;
        String dayInt =
            temp <= 0 || temp > lastDayOfMonth ? "" : "${w * 7 + d - offSet}";
        var day = Expanded(flex: 1, child: textForBody(dayInt));
        week.add(day);
      }
      monthArr.add(Expanded(flex: 1, child: Row(children: week)));
    }
    return monthArr;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(flex: 1, child: textForBody("$monthNames[month]")),
          ...calendarBody()
        ],
      ),
    );
  }
}
