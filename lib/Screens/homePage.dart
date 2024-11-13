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
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: GNav(
                  onTabChange: _onItemTapped,
                  color: Colors.white,
                  activeColor: Colors.white,
                  tabBackgroundColor: Color.fromARGB(83, 157, 244, 186),
                  padding: EdgeInsets.all(20),
                  backgroundColor: Colors.black,
                  gap: 8,
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
