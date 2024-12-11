import 'package:flutter/material.dart';
import 'package:todolist_app/scenes/tasks/tasks_view.dart';
import '../singup/singup_view.dart';

class LoginRouter {
  static void goToTasks(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TodoListScreen(),
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
