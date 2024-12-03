import 'package:flutter/material.dart';
import 'package:todolist_app/scenes/tasks/tasks_service.dart';
import 'package:todolist_app/scenes/tasks/tasks_view.dart';
import '../singup/singup_view.dart';

class LoginRouter {
  static void goToTasks(BuildContext context, String authToken) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TasksView(tasksService: TasksService()),
      ),
    );
  }

  static void goToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpView()),
    );
  }
}
