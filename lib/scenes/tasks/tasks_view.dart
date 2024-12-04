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

  void _showCreateTaskDialog(BuildContext context) {
    final _titleController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _startDateController = TextEditingController();
    final _endDateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Criar Tarefa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Descrição'),
              ),
              TextField(
                controller: _startDateController,
                decoration:
                    InputDecoration(labelText: 'Data de Início (YYYY-MM-DD)'),
              ),
              TextField(
                controller: _endDateController,
                decoration:
                    InputDecoration(labelText: 'Data de Término (YYYY-MM-DD)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                final task = {
                  'title': _titleController.text,
                  'description': _descriptionController.text,
                  'startAt': _startDateController.text,
                  'endAt': _endDateController.text,
                };

                try {
                  await widget.tasksService.addTask(task);
                  setState(() {
                    _tasks = widget.tasksService.fetchTasks();
                  });
                  Navigator.of(context).pop();
                } catch (e) {
                  // Exibir mensagem de erro
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Erro ao criar tarefa: $e')),
                  );
                }
              },
              child: Text('Criar'),
            ),
          ],
        );
      },
    );
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
        onPressed: () => _showCreateTaskDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
