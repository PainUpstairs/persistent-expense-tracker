


void main(List<String> args) {
  final date = DateTime.utc(2024,4);

  print("now->"+date.toString());
  print("now->"+date.day.toString());
  print("now->"+date.weekday.toString());

   var nextMonth = DateTime.utc(2024,4+1);
    nextMonth  = nextMonth.add(
      const Duration(days: -1)
    );
    int lastDayOfMonth = nextMonth.day;
    print(lastDayOfMonth.toString());
}