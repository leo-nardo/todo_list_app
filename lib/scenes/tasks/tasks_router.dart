import 'package:flutter/material.dart';

class TasksRouter {
  static void goToTasks(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/tasks');
  }
}
