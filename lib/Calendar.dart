import 'package:flutter/material.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  var months = [
    Month(
      nameTh: 'มกราคม',
      nameEn: 'January',
      number: 1,
      firstDay: 1,
      lastDay: 31,
    ),
    Month(
      nameTh: 'กุมภาพันธ์',
      nameEn: 'February',
      number: 2,
      firstDay: -2,
      lastDay: 28,
    ),
    Month(
      nameTh: 'มีนาคม',
      nameEn: 'March',
      number: 3,
      firstDay: -2,
      lastDay: 31,
    ),
    Month(
      nameTh: 'เมษายน',
      nameEn: 'April',
      number: 4,
      firstDay: -5,
      lastDay: 30,
    ),
    Month(
      nameTh: 'พฤษภาคม',
      nameEn: 'May',
      number: 5,
      firstDay: 0,
      lastDay: 31,
    ),
    Month(
      nameTh: 'มิถุนายน',
      nameEn: 'June',
      number: 6,
      firstDay: -3,
      lastDay: 30,
    ),
    Month(
      nameTh: 'กรกฎาคม',
      nameEn: 'July',
      number: 7,
      firstDay: -5,
      lastDay: 31,
    ),
    Month(
      nameTh: 'สิงหาคม',
      nameEn: 'August',
      number: 8,
      firstDay: -1,
      lastDay: 31,
    ),
    Month(
      nameTh: 'กันยายน',
      nameEn: 'September',
      number: 9,
      firstDay: -4,
      lastDay: 30,
    ),
    Month(
      nameTh: 'ตุลาคม',
      nameEn: 'October',
      number: 10,
      firstDay: 1,
      lastDay: 31,
    ),
    Month(
      nameTh: 'พฤศจิกายน',
      nameEn: 'November',
      number: 11,
      firstDay: -2,
      lastDay: 30,
    ),
    Month(
      nameTh: 'ธันวาคม',
      nameEn: 'December',
      number: 12,
      firstDay: -4,
      lastDay: 31,
    ),
  ];

  late Month _selectedMonth;

  @override
  void initState() {
    super.initState();
    _selectedMonth = months[0];
  }

  @override
  Widget build(BuildContext context) {
    var monthNameList = [
      [months[0], months[1], months[2]],
      [months[3], months[4], months[5]],
      [months[6], months[7], months[8]],
      [months[9], months[10], months[11]],
    ];

    return Scaffold(
      //appBar: AppBar(title: const Text('CALENDAR 2023')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // paradigm
        child: Column(
          children: [
            for (var i = 0; i < monthNameList.length; i++)
              _buildMonthRow(monthNameList[i]),
            // spacing
            const SizedBox(height: 16.0),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent.withOpacity(0.1),
                ),
                child: _buildCalendar(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildCalendar() {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_selectedMonth.nameTh}\n2566',
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              '${_selectedMonth.number}',
              style: const TextStyle(fontSize: 40.0),
            ),
            Text(
              '${_selectedMonth.nameEn}\n2023',
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),

        // Spacing before the row of weekday name
        const SizedBox(height: 24.0),


        _buildCalendarHeaderRow(),


        for (var i = _selectedMonth.firstDay;
        i <= _selectedMonth.lastDay;
        i += 7)
          _buildCalendarRow(i, _selectedMonth.lastDay),


      ],
    );
  }

  Expanded _buildCalendarRow(int startDay, int lastDayOfMonth) {
    return Expanded(
      child: Row(
        children: [
          for (var i = startDay; i < startDay + 7; i++)
            Expanded(
              child: Text(
                (i < 1) || (i > lastDayOfMonth) ? '' : i.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(color: i == startDay ? Colors.red : null),
              ),
            ),
        ],
      ),
    );
  }

  Expanded _buildCalendarHeaderRow() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.black),
            bottom: BorderSide(width: 1.0, color: Colors.black),
          ),
        ),
        child: Row(
          children: const [
            Expanded(
              child: Text(
                'S',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Expanded(child: Text('M', textAlign: TextAlign.center)),
            Expanded(child: Text('T', textAlign: TextAlign.center)),
            Expanded(child: Text('W', textAlign: TextAlign.center)),
            Expanded(child: Text('Th', textAlign: TextAlign.center)),
            Expanded(child: Text('F', textAlign: TextAlign.center)),
            Expanded(child: Text('S', textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthRow(List<Month> monthList) {
    return Row(
      children: monthList.map((item) {
        return _buildMonthButton(item);
      }).toList(),
    );
  }

  Expanded _buildMonthButton(Month month) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: OutlinedButton(
          onPressed: () {
            debugPrint(month.toString());

            setState(() {
              _selectedMonth = month;
            });
          },
          child: Text(month.nameEn),
        ),
      ),
    );
  }
}

class Month {
  final String nameTh;
  final String nameEn;
  int number;
  int firstDay;
  int lastDay;

  Month({
    required this.nameTh,
    required this.nameEn,
    required this.number,
    required this.firstDay,
    required this.lastDay,
  });

  @override
  String toString() {
    return '$number -  $nameEn - $nameTh';
  }
}