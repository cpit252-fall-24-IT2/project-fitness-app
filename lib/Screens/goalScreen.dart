import 'package:fitness_app/Widget/WorkPlan.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'SchedulePage.dart';

class Goalscreen extends StatefulWidget {
  const Goalscreen({Key? key}) : super(key: key);

  @override
  State<Goalscreen> createState() => _GoalPageState();
}

class _GoalPageState extends State<Goalscreen> {
  final TextEditingController _preferencesController = TextEditingController();
  final TextEditingController _healthConditionsController =
      TextEditingController();
  final TextEditingController _daysPerWeekController = TextEditingController();
  final TextEditingController _sessionDurationController =
      TextEditingController();
  final TextEditingController _planDurationController = TextEditingController();

  String? _selectedGoal;
  String? _selectedFitnessLevel;
  String _language = "en";

  bool _hasSchedule = false;
  late WorkPlan _workPlan;

  final List<String> _goals = [
    "Build muscle",
    "Lose weight",
    "Improve overall fitness"
  ];
  final List<String> _fitnessLevels = ["Beginner", "Intermediate", "Advanced"];
  // Api Request
  Future<void> createWorkoutPlan() async {
    final url =
        'https://ai-workout-planner-exercise-fitness-nutrition-guide.p.rapidapi.com/customWorkoutPlan?noqueue=1';
    final headers = {
      "x-rapidapi-key": "f0a83511b9mshea5822d426f7eb9p144349jsn203886b708f2",
      "x-rapidapi-host":
          "ai-workout-planner-exercise-fitness-nutrition-guide.p.rapidapi.com",
      "Content-Type": "application/json",
    };

    final body = jsonEncode({
      "goal": _selectedGoal,
      "fitness_level": _selectedFitnessLevel,
      "preferences": _preferencesController.text
          .trim()
          .split(',')
          .map((e) => e.trim())
          .toList(),
      "health_conditions": _healthConditionsController.text
          .trim()
          .split(',')
          .map((e) => e.trim())
          .toList(),
      "schedule": {
        "days_per_week": int.tryParse(_daysPerWeekController.text.trim()) ?? 0,
        "session_duration":
            int.tryParse(_sessionDurationController.text.trim()) ?? 0
      },
      "plan_duration_weeks":
          int.tryParse(_planDurationController.text.trim()) ?? 0,
      "lang": _language,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final result = data['result'];

        setState(() {
          _workPlan = WorkPlan.fromJson(result);
          _hasSchedule = true;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SchedulePage(workPlan: _workPlan),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Failed to create workout plan: ${response.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error occurred while creating plan.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set Your Goal"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Dropdown for goal selection
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Select Goal"),
              value: _selectedGoal,
              items: _goals
                  .map((goal) =>
                      DropdownMenuItem(value: goal, child: Text(goal)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedGoal = value;
                });
              },
            ),

            // Dropdown for fitness level selection
            DropdownButtonFormField<String>(
              decoration:
                  const InputDecoration(labelText: "Select Fitness Level"),
              value: _selectedFitnessLevel,
              items: _fitnessLevels
                  .map((level) =>
                      DropdownMenuItem(value: level, child: Text(level)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedFitnessLevel = value;
                });
              },
            ),

            TextField(
              controller: _preferencesController,
              decoration: const InputDecoration(
                  labelText: "Preferences (comma-separated)"),
            ),

            TextField(
              controller: _healthConditionsController,
              decoration: const InputDecoration(
                  labelText: "Health Conditions (comma-separated)"),
            ),

            TextField(
              controller: _daysPerWeekController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Days per Week"),
            ),

            TextField(
              controller: _sessionDurationController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Session Duration (minutes)"),
            ),

            TextField(
              controller: _planDurationController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: "Plan Duration (weeks)"),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: createWorkoutPlan,
              child: const Text("Create Workout Plan"),
            ),

            // Display button if schedule exists.
            if (_hasSchedule)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SchedulePage(workPlan: _workPlan),
                    ),
                  );
                },
                child: const Text("View Schedule"),
              ),
          ],
        ),
      ),
    );
  }
}
