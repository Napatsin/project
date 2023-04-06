import 'package:flutter/material.dart';
import 'package:project/Calendar.dart';
import 'package:project/page/converter_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _activeTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('APP')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.change_circle_outlined),
            label: 'unit_change',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
        ],
        onTap: (index) {
          setState(() {
            _activeTabIndex = index;
          });
        },
      ),
      body: _activeTabIndex == 0 ? const unitPage() : const MyCalendar(),
    );
  }
}