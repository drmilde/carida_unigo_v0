import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

class WeekdaySelectWidget extends StatefulWidget {
  DateTime today = DateTime.now();
  Function(DateTime) onChange;

  WeekdaySelectWidget({required this.today, required this.onChange, Key? key})
      : super(key: key) {
    // TODO: implement DateSelectWidget
  }

  @override
  State<WeekdaySelectWidget> createState() => _WeekdaySelectWidgetState();
}

class _WeekdaySelectWidgetState extends State<WeekdaySelectWidget> {
  UGStateController _controller = Get.find();
  List<String> dateStrings = [];
  List<DateTime> weekDates = [];
  int selected = 3;

  @override
  void initState() {
    selected = widget.today.weekday - 1;
    DateTime mo =
        widget.today.subtract(Duration(days: (widget.today.weekday - 1)));
    DateTime di = mo.add(Duration(days: 1));
    DateTime mi = di.add(Duration(days: 1));
    DateTime don = mi.add(Duration(days: 1));
    DateTime fr = don.add(Duration(days: 1));
    DateTime sa = fr.add(Duration(days: 1));
    DateTime so = sa.add(Duration(days: 1));
    dateStrings = [
      "${mo.day}.${mo.month}",
      "${di.day}.${di.month}",
      "${mi.day}.${mi.month}",
      "${don.day}.${don.month}",
      "${fr.day}.${fr.month}",
      "${sa.day}.${sa.month}",
      "${so.day}.${so.month}",
    ];
    weekDates = [mo, di, mi, don, fr, sa, so];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 350,
      child: Row(children: [
        _makeMyDay(day: "Mo", date: "${dateStrings[0]}", index: 0),
        _makeMyDay(day: "Di", date: "${dateStrings[1]}", index: 1),
        _makeMyDay(day: "Mi", date: "${dateStrings[2]}", index: 2),
        _makeMyDay(day: "Do", date: "${dateStrings[3]}", index: 3),
        _makeMyDay(day: "Fr", date: "${dateStrings[4]}", index: 4),
        _makeMyDay(day: "Sa", date: "${dateStrings[5]}", index: 5),
        _makeMyDay(day: "So", date: "${dateStrings[6]}", index: 6),
      ]),
    );
  }

  Widget _makeMyDay({String day = "", String date = "", int index = 0}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
        widget.onChange(weekDates[selected]);
      },
      child: Container(
        width: 48,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: TextStyle(
                fontSize: (selected == index) ? 18 : 14,
                color: (selected == index)
                    ? _controller.appConstants.turquoise
                    : _controller.appConstants.black,
              ),
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: (selected == index) ? 18 : 14,
                color: (selected == index)
                    ? _controller.appConstants.turquoise
                    : _controller.appConstants.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
