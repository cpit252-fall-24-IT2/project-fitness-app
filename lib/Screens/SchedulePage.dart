import 'package:flutter/material.dart';
import 'package:fitness_app/Widget/WorkPlan.dart';

class SchedulePage extends StatelessWidget {
  final WorkPlan workPlan;

  const SchedulePage({Key? key, required this.workPlan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workout Schedule"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Goal: ${workPlan.goal}",
                style: const TextStyle(fontSize: 18)),
            Text("Fitness Level: ${workPlan.fitnessLevel}",
                style: const TextStyle(fontSize: 16)),
            Text("Total Weeks: ${workPlan.totalWeeks}",
                style: const TextStyle(fontSize: 16)),
            ...workPlan.exercises.map((dayPlan) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Day: ${dayPlan.day}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  ...dayPlan.exercises.map((exercise) {
                    return Text("- ${exercise.name}: ${exercise.duration}");
                  }).toList(),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
