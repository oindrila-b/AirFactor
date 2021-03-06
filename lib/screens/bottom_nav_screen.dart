import 'package:airpol/screens/dashboard.dart';
import 'package:airpol/screens/forecastScreen.dart';
import 'package:flutter/material.dart';
import 'package:airpol/screens/stats_screen.dart';
import '../utils/colors.dart' as color;
import 'air_factor_info.dart';



class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    Dashboard(),
    StatsScreen(),
    ForecastScreen(),
    AirFactorInfo(),
    Scaffold(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home, Icons.insert_chart, Icons.event_note, Icons.info]
            .asMap()
            .map((key, value) => MapEntry(
          key,
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: _currentIndex == key
                    ? color.AppColors.darkPrimary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Icon(value),
            ),

          ),
        ))
            .values
            .toList(),
      ),
    );
  }
}