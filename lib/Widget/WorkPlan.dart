class WorkPlan {
  final String goal;
  final String fitnessLevel;
  final int totalWeeks;
  final Schedule schedule;
  final List<DayPlan> exercises;

  WorkPlan({
    required this.goal,
    required this.fitnessLevel,
    required this.totalWeeks,
    required this.schedule,
    required this.exercises,
  });

  factory WorkPlan.fromJson(Map<String, dynamic> json) {
    return WorkPlan(
      goal: json['goal'],
      fitnessLevel: json['fitness_level'],
      totalWeeks: json['total_weeks'],
      schedule: Schedule.fromJson(json['schedule']),
      exercises: (json['exercises'] as List)
          .map((exercise) => DayPlan.fromJson(exercise))
          .toList(),
    );
  }
}

class Schedule {
  final int daysPerWeek;
  final int sessionDuration;

  Schedule({required this.daysPerWeek, required this.sessionDuration});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      daysPerWeek: json['days_per_week'],
      sessionDuration: json['session_duration'],
    );
  }
}

class DayPlan {
  final String day;
  final List<Exercise> exercises;

  DayPlan({required this.day, required this.exercises});

  factory DayPlan.fromJson(Map<String, dynamic> json) {
    return DayPlan(
      day: json['day'],
      exercises:
          (json['exercises'] as List).map((e) => Exercise.fromJson(e)).toList(),
    );
  }
}

class Exercise {
  final String name;
  final String duration;
  final String repetitions;
  final String sets;
  final String equipment;

  Exercise({
    required this.name,
    required this.duration,
    required this.repetitions,
    required this.sets,
    required this.equipment,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'],
      duration: json['duration'],
      repetitions: json['repetitions'],
      sets: json['sets'],
      equipment: json['equipment'],
    );
  }
}
