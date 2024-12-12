// LoginRouter
import 'package:flutter/material.dart';
import 'package:todolist_app/scenes/tasks/tasks_view.dart';

class LoginRouter {
  static void goToTasks(BuildContext context, String authToken) {
    final tasksService = TasksService();
    tasksService.setAuthToken(authToken); 
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
<<<<<<< HEAD
        builder: (context) => TasksView(
            tasksService: tasksService), // Passa o service com o token
=======
        builder: (context) => const TodoListScreen(),
>>>>>>> a2eb8f66b738f17618bdbe2fae1c2f231fcccbde
      ),
    );
  }
}
