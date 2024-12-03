import 'package:flutter/material.dart';
import 'tasks_service.dart';
import 'tasks_view.dart';

class TasksFactory {
  static Widget create() {
    final tasksService = TasksService();
    return TasksView(tasksService: tasksService);
  }
}
