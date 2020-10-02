import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/screens/all_country_screen.dart';
import 'package:flutter_covid_tracker/screens/global_screen.dart';
import 'package:flutter_covid_tracker/screens/home_country_screen.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> children = [
    HomeCountryScreen(),
    GlobalScreen(),
    AllCountriesScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(LineIcons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.globe), title: Text('Global')),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.flag), title: Text('All Countries')),
        ],
      ),
    );
  }
}
