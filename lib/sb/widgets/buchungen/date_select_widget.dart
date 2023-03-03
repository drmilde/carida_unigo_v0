import 'package:flutter/material.dart';

class DateSelectWidget extends StatefulWidget {
  DateSelectWidget({Key? key}) : super(key: key) {
    // TODO: implement DateSelectWidget
  }

  @override
  State<DateSelectWidget> createState() => _DateSelectWidgetState();
}

class _DateSelectWidgetState extends State<DateSelectWidget> {
  List<Widget> tage = [];
  int selected = 3;

  @override
  void initState() {
    tage = [
      _makeMyDay(day: "Mo", date: "01.03", index: 0),
      _makeMyDay(day: "Di", date: "02.03", index: 1),
      _makeMyDay(day: "Mi", date: "03.03", index: 2),
      _makeMyDay(day: "Do", date: "04.03", index: 3),
      _makeMyDay(day: "Fr", date: "05.03", index: 4),
      _makeMyDay(day: "Sa", date: "06.03", index: 5),
      _makeMyDay(day: "So", date: "07.03", index: 6),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:48,
      //width: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _makeMyDay(index: index, day: "Da", date: "01.02"),
            );
          }),
    );
  }

  Widget _makeMyDay({String day = "", String date = "", int index = 0}) {
    return GestureDetector(
      onTap: () {
        print(index);
        setState(() {
          selected = index;
        });
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: TextStyle(
                fontSize: (selected == index) ? 20 : 16,
              ),
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: (selected == index) ? 20 : 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
