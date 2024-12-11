import 'package:flutter/material.dart';
import 'package:todolist_app/scenes/login/login_view.dart';
import 'scenes/tasks/tasks_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design System Samples',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
