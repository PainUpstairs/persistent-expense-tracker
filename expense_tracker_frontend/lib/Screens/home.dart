import 'package:expense_tracker_frontend/Screens/Calendar.dart';
import 'package:expense_tracker_frontend/Screens/Calendar/calendar_event.dart';
import 'package:expense_tracker_frontend/Screens/DatabaseSetup/database_test.dart';
import 'package:expense_tracker_frontend/Util/Styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Widget HomeComp(Widget comp, [Color? color = Colors.black]) {
      return Container(
        color: color,
        child: comp,
      );
    }

    return  Center(
        child: Container(
          color: Colors.white ,
          child:  const Row(
                children: [
                  // Expanded(flex: 1, child: TableComplexExample()),
                   Expanded(flex: 1, child: DBTest()),
                  ],
              ),
        ));
  }
}
