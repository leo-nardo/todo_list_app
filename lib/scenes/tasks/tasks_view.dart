import 'package:flutter/material.dart';
import 'tasks_service.dart';

class TasksView extends StatefulWidget {
  final TasksService tasksService;

  const TasksView({required this.tasksService, Key? key}) : super(key: key);

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  late Future<List<Map<String, dynamic>>> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = widget.tasksService.fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tarefas')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _tasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final tasks = snapshot.data!;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task['title']),
                  subtitle: Text(task['description']),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Implementar exclusão
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Nenhuma tarefa encontrada'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar para uma tela de criação de tarefas
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
