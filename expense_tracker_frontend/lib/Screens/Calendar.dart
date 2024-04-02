import 'package:expense_tracker_frontend/Util/Styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    Widget TextForBody(String text) {
      return Text(text, style: Styling().themedata.textTheme.bodyLarge);
    }

    Widget calendarComp([Color? color = Colors.black]) {
      return Container(
        color: color,
      );
    }

    return Center(
      child: Row(
        children: [
          Expanded(flex: 1, child: calendarComp()),
          Expanded(
              flex: 1, child: calendarComp(Color.fromARGB(31, 219, 155, 155)))
        ],
      ),
    );
  }
}
