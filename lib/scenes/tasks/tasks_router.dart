import 'package:flutter/material.dart';
import 'tasks_factory.dart';
import 'tasks_service.dart';

class TasksRouter {
  static void goToTasks(BuildContext context, String authToken) {
    final tasksService = TasksService();
    
    tasksService.setAuthToken(authToken);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TasksFactory.create(),
      ),
    );
  }
}
