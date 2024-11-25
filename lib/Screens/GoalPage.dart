import 'package:fitness_app/Widget/MultiSelectChip.dart';
import 'package:flutter/material.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({Key? key}) : super(key: key);

  @override
  State<GoalPage> createState() => _CreateGoalPageState();
}

class _CreateGoalPageState extends State<GoalPage> {
  final _formKey = GlobalKey<FormState>();

  String? goal;
  String? fitnessLevel;
  List<String> preferences = [];
  String? healthConditions;
  int? daysPerWeek;
  int? sessionDuration;
  int? planDurationWeeks;
  String? language;

  // Dropdown options
  final List<String> goals = ["Build muscle", "Lose weight"];
  final List<String> fitnessLevels = ["Beginner", "Intermediate", "Advanced"];
  final List<String> languages = ["English", "Spanish"];
  final List<String> workoutPreferences = [
    "HIIT",
    "Yoga",
    "Weight Training",
    "Cardio"
  ];

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Print values for debugging
      print("Goal: $goal");
      print("Fitness Level: $fitnessLevel");
      print("Preferences: $preferences");
      print("Health Conditions: $healthConditions");
      print("Days Per Week: $daysPerWeek");
      print("Session Duration: $sessionDuration");
      print("Plan Duration: $planDurationWeeks");
      print("Language: $language");

      Navigator.pop(context); // Go back to the goal page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Custom Workout Plan",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  value: goal,
                  items: goals.map((goal) {
                    return DropdownMenuItem(
                      value: goal,
                      child: Text(goal),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => goal = value),
                  decoration: const InputDecoration(labelText: "Goal"),
                  validator: (value) =>
                      value == null ? "Please select a goal" : null,
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: fitnessLevel,
                  items: fitnessLevels.map((level) {
                    return DropdownMenuItem(
                      value: level,
                      child: Text(level),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => fitnessLevel = value),
                  decoration: const InputDecoration(labelText: "Fitness Level"),
                  validator: (value) =>
                      value == null ? "Please select a fitness level" : null,
                ),
                const SizedBox(height: 20),
                MultiSelectChip(
                  options: workoutPreferences,
                  selectedOptions: preferences,
                  onSelectionChanged: (selected) {
                    setState(() {
                      preferences = selected;
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) => healthConditions = value,
                  decoration:
                      const InputDecoration(labelText: "Health Conditions"),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) => daysPerWeek = int.tryParse(value ?? "0"),
                  decoration: const InputDecoration(labelText: "Days per Week"),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a number" : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) =>
                      sessionDuration = int.tryParse(value ?? "0"),
                  decoration: const InputDecoration(
                      labelText: "Session Duration (minutes)"),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a number" : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) =>
                      planDurationWeeks = int.tryParse(value ?? "0"),
                  decoration:
                      const InputDecoration(labelText: "Plan Duration (weeks)"),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a number" : null,
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: language,
                  items: languages.map((lang) {
                    return DropdownMenuItem(
                      value: lang,
                      child: Text(lang),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => language = value),
                  decoration: const InputDecoration(labelText: "Language"),
                  validator: (value) =>
                      value == null ? "Please select a language" : null,
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _saveForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: const Text(
                      "Create Plan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

