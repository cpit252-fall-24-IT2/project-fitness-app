import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 9, 20, 22),
              Color.fromARGB(255, 40, 80, 90),
              Color.fromARGB(255, 75, 136, 151), // Light blue
              Color.fromARGB(255, 127, 238, 164) // Light greenish-blue
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Header
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Welcome Back, Ready to Crush Your Goals?",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),

            // Banner Section
            Container(
              height: 200,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/F.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Expanded(
              child: Center(
                child: Text("Workout Suggestions Coming Soon!",
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
