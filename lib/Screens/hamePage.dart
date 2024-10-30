// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Hamepage extends StatefulWidget {
  const Hamepage({super.key});

  @override
  State<Hamepage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Hamepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Home Page",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
            )
          ],
        ),
      ),
    );
  }
}
