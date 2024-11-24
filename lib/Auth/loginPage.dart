import 'package:fitness_app/Constant/Varibles.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/DB/Database.dart';
import 'package:fitness_app/Screens/homePage.dart';
import 'package:fitness_app/Auth/SignupPage.dart';
import 'package:fitness_app/Constant/form_container_widget.dart';
import 'GradientAnimation.dart'; 

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Loginpage> with SingleTickerProviderStateMixin { 
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

  Future<void> _handleLogin() async {
    String email = AppData().emailController.text.trim();
    String password = AppData().passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        AppData().errorMessage = "Please fill in all fields";
      });
      return;
    }

    List<Map> response = await  AppData().sqlDb.readData('''
      SELECT * FROM User WHERE eamil = "$email" AND password = "$password"
    ''');

    if (response.isNotEmpty) {
      await _getUserName();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
        (route) => false,
      );
    } else {
      setState(() {
         AppData().errorMessage = "Invalid email or password";
      });
    }
  }
  Future<void> _getUserName() async {
  String email = AppData().emailController.text.trim();
  String password = AppData().passwordController.text.trim();

 
  List<Map> response = await AppData().sqlDb.readData('''
    SELECT * FROM User WHERE eamil = "$email" AND password = "$password"
  ''');

  
  if (response.isNotEmpty) {
   
    AppData().userName = response[0]['user_name']; 
  } else {
    
    AppData().userName = "Guest"; 
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
                  "Your Fitness",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                SizedBox(height: 50),
                FormContainerWidget(
                  controller:  AppData().emailController,
                  hintText: "Email",
                  isPasswordField: false,
                ),
                SizedBox(height: 20),
                FormContainerWidget(
                  controller:  AppData().passwordController,
                  hintText: "Password",
                  isPasswordField: true,
                ),
                SizedBox(height: 10),
                if ( AppData().errorMessage != null)
                  Text(
                     AppData().errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: _handleLogin,
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
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
                      "Don't have an account?",
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
                          MaterialPageRoute(builder: (context) => SignupPage()),
                          (route) => false,
                        );
                      },
                      child: Text(
                        "Sign Up",
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
