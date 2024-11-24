import 'package:flutter/material.dart';
import 'package:fitness_app/Auth/LoginPage.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Logout Confirmation'),
                    content: const Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Loginpage()),
                            (route) => false,
                          );
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'Sign Out',
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 9, 20, 22),
              Color.fromARGB(255, 40, 80, 90),
              Color.fromARGB(255, 75, 136, 151),
              Color.fromARGB(255, 127, 238, 164)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/7922326.png'),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Sections for options
              _buildSectionHeader('Mimi Headline'),
              _buildListTile('My Workout', Icons.fitness_center),
              _buildListTile('Customer Service', Icons.support_agent),
              _buildListTile('Payment Methods', Icons.payment),

              const SizedBox(height: 10),

              _buildSectionHeader('Content'),
              _buildListTile('Favourite', Icons.favorite),

              const SizedBox(height: 10),

              _buildSectionHeader('Preferences'),
              _buildListTile('Language', Icons.language),
              _buildListTile('Darkmode', Icons.dark_mode),
              _buildListTile('Only Download from Wifi', Icons.wifi),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
      onTap: () {},
    );
  }
}
