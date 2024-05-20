import 'package:expense_tracker_frontend/Screens/DatabaseSetup/Model/item.dart';
import 'package:expense_tracker_frontend/Screens/DatabaseSetup/Model/lookup.dart';
import 'package:expense_tracker_frontend/Screens/DatabaseSetup/main_dataDB.dart';
import 'package:flutter/material.dart';

class DBTest extends StatefulWidget {
  const DBTest({super.key});

  @override
  State<DBTest> createState() => _DBTestState();
}

class _DBTestState extends State<DBTest> {
  final maindataDb = MainDataDB();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void fetchData() async {
    var allMainData = await maindataDb.fetchAllMainData();
    for (var item in allMainData) {
      print("item->$item");
    }

    var allLookupData = await maindataDb.fetchAllLookUpData();
    for (var lookup in allLookupData) {
      print("lookup->$lookup");
    }
  }

  void deleteTableMainData() async {
    maindataDb.dropTable("lookup");
  }

  void insertMainData() async {
    print("insertData");
    var item = Item(
        id: null,
        type: "testType",
        name: "testName",
        value: "testValue",
        createdAt: convertDateTimeToStr(DateTime.now()),
        category: "testCategory");
    await maindataDb.insertMainData(item);
  }

  void insertLookupData() async {
    print("insertLookupData");
    var item1 = Lookup(name: "Category", code: "RMDR", description: "Reminder");
    var item2 = Lookup(name: "Category", code: "KRCH", description: "Karcha");
    var item3 = Lookup(name: "Category", code: "NOTE", description: "Notes");

    print([item1,item2, item3]);
    await maindataDb.insertLookupData([item1,item2, item3]);
  }

  String convertDateTimeToStr(DateTime dateTime) {
    return dateTime
        .toString()
        .split(".")[0]
        .replaceAll("-", "")
        .replaceAll(" ", "")
        .replaceAll(":", "");
  }

  void testFunction() {
    var dateTime = DateTime.now();
    print("convertDateTimeToStr->${convertDateTimeToStr(dateTime)}");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("DB Test"),
          TextButton(onPressed: insertMainData, child: const Text("Add")),
          TextButton(onPressed: insertLookupData, child: const Text("Add lookup")),
          TextButton(onPressed: fetchData, child: const Text("Show")),
          TextButton(
              onPressed: deleteTableMainData,
              child: const Text("Drop Main Table")),
          TextButton(
              onPressed: testFunction, child: const Text("Test Function")),
        ],
      ),
    );
  }
}
