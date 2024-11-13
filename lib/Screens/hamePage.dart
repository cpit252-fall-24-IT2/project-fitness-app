// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_app/Screens/goalPage.dart';
import 'package:fitness_app/Screens/profilePage.dart';
import 'package:flutter/material.dart';

class Hamepage extends StatefulWidget {
  const Hamepage({super.key});

  @override
  State<Hamepage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Hamepage> {
  int _currentIndex = 0;

  // List of pages for each tab
  final List<Widget> _pages = [
    Center(child: Text("Home Screen")),
    Goalpage(),
    Profilepage(),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: "Goal",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
