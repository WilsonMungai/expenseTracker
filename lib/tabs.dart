import 'package:expensetracker/pages/add.dart';
import 'package:expensetracker/pages/expenses.dart';
import 'package:expensetracker/pages/reports.dart';
import 'package:expensetracker/pages/settings.dart';
import 'package:flutter/material.dart';

class TabsController extends StatefulWidget {
  const TabsController({super.key});

  @override
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController> {
  var _selectedIndex = 0;

  static const List<Widget> pages = [Expenses(), Reports(), Add(), Settings()];
  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_selectedIndex'),
        backgroundColor: Colors.blueGrey,
      ),
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
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.orange,
        selectedFontSize: 15,
        unselectedItemColor: Colors.blueGrey,
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
    );
  }
}
