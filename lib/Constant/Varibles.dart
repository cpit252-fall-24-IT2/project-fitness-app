import 'package:fitness_app/DB/Database.dart';
import 'package:flutter/material.dart';

class AppData {
  static final AppData _instance = AppData._internal();

  factory AppData() {
    return _instance;
  }

  AppData._internal();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorMessage;
  SqlDb sqlDb = SqlDb();
  String? userName;
}

