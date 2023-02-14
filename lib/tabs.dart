import 'package:expensetracker/pages/add.dart';
import 'package:expensetracker/pages/expenses.dart';
import 'package:expensetracker/pages/reports.dart';
import 'package:expensetracker/pages/settings.dart';
import 'package:flutter/material.dart';
// import '../types/widgets.dart';

class TabsController extends StatefulWidget {
  const TabsController({super.key});

  @override
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController> {
  var _selectedIndex = 0;

  static const List<Widget> _pages = [Expenses(), Reports(), Add(), Settings()];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blueGrey,
        title: Text(_pages[_selectedIndex].toString()),
      ),
      backgroundColor: Colors.black,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.paid),
            label: 'Expenses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemSelected,
        type: BottomNavigationBarType.fixed,
        // fixedColor: Colors.white,
        selectedItemColor: Colors.blue,
        selectedFontSize: 15,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
    );
  }
}
