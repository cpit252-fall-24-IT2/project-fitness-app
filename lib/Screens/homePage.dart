// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_app/Screens/goalScreen.dart';
import 'package:fitness_app/Screens/homeScreen.dart';
import 'package:fitness_app/Screens/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Homepage> {
  int _currentIndex = 0;

  // List of pages for each tab
  final List<Widget> _pages = [
    Homescreen(),
    Goalscreen(),
    Profilescreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 66, 126, 141), // Light blue
                Color.fromARGB(255, 127, 238, 164) // Light greenish-blue
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 3,
              vertical: 7,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(33),
              child: GNav(
                  onTabChange: _onItemTapped,
                  color: Colors.white,
                  activeColor: Colors.white,
                  tabBackgroundColor:
                      Color.fromARGB(83, 157, 244, 186).withOpacity(0.1),
                  tabActiveBorder: Border.all(
                      color: const Color.fromARGB(255, 40, 80, 90), width: 2),
                  curve: Curves.easeInToLinear,
                  duration: Duration(milliseconds: 500),
                  padding: EdgeInsets.all(18),
                  backgroundColor: Colors.black,
                  gap: 5,
                  tabs: [
                    GButton(
                      icon: Icons.home_outlined,
                      text: "Home",
                    ),
                    GButton(
                      icon: Icons.flag_outlined,
                      text: "Goal",
                    ),
                    GButton(
                      icon: Icons.person_2_outlined,
                      text: "Profile",
                    ),
                  ]),
            ),
          ),
        ));
  }
}
