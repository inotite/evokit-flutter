
import 'package:evokit/screens/calc_screen.dart';
import 'package:evokit/screens/saved_screen.dart';
import 'package:evokit/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class TabScreen extends StatefulWidget {

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CalcScreen(),
    SavedScreen(),
    SettingsScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<bool> _onBackPressed() async {
    // return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Calculator'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(OMIcons.bookmarks),
              title: Text('Saved'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(OMIcons.settings),
              title: Text('Settings')
            )
          ],
        ),
      ),
    );
  }
}
