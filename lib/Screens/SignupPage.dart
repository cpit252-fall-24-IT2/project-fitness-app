import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 127, 238, 164),
              Color.fromARGB(255, 75, 136, 151), // Light blue
              Color.fromARGB(255, 40, 80, 90),
              Color.fromARGB(255, 9, 20, 22),
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 0, 0, 0),
            ],
            end: Alignment.bottomRight,
            begin: Alignment.topLeft,
          ),
        ),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 78.1),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
