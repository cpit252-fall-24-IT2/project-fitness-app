// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fitness_app/DB/Database.dart';
import 'package:fitness_app/Auth/loginPage.dart';
import 'package:fitness_app/Constant/form_container_widget.dart';
import 'GradientAnimation.dart'; 

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignupPage> with SingleTickerProviderStateMixin {
  //fix this.
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  SqlDb sqlDb = SqlDb(); 

  late GradientAnimation _gradientAnimation; 

  @override
  void initState() {
    super.initState();
    _gradientAnimation = GradientAnimation(vsync: this); 
  }

  @override
  void dispose() {
    _gradientAnimation.dispose(); 
    super.dispose();
  }

  Future<void> _signUp() async {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please fill in all fields"),
        backgroundColor: Colors.red,
      ));
      return;
    }

    int response = await sqlDb.insertData('''
      INSERT INTO User (user_name, eamil, password) 
      VALUES ("$username", "$email", "$password")
    ''');

    if (response > 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Sign-up successful!"),
        backgroundColor: Colors.green,
      ));

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Loginpage()),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Sign-up failed, try again."),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _gradientAnimation.controller,
        builder: (context, _) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 9, 20, 22),
                Color.fromARGB(255, 40, 80, 90),
                Color.fromARGB(255, 75, 136, 151),
                Color.fromARGB(255, 127, 238, 164)
              ],
              begin: _gradientAnimation.topAlignmentAnimation.value,
              end: _gradientAnimation.bottomAlignmentAnimation.value,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                SizedBox(height: 50),
                FormContainerWidget(
                  controller: _usernameController,
                  hintText: "Username",
                  isPasswordField: false,
                ),
                SizedBox(height: 20),
                FormContainerWidget(
                  controller: _emailController,
                  hintText: "Email",
                  isPasswordField: false,
                ),
                SizedBox(height: 20),
                FormContainerWidget(
                  controller: _passwordController,
                  hintText: "Password",
                  isPasswordField: true,
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: _signUp,
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Loginpage()),
                          (route) => false,
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 1.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
