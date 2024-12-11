import 'package:flutter/material.dart';

import '../../design_system/components/badge/badge_view_model.dart';
import '../../design_system/components/buttons/button/action_button.dart';
import '../../design_system/components/buttons/button/action_button_view_model.dart';
import '../../design_system/components/card_option/card_option.dart';
import '../../design_system/components/card_option/card_option_view_model.dart';
import '../../design_system/components/checkbox/checkbox_view_model.dart';
import '../../design_system/components/checkbox/custom_checkbox.dart';
import '../../design_system/components/segmented/segmented.dart';
import '../../design_system/components/segmented/segmented_view_model.dart';
import '../../design_system/shared/styles.dart';

class Task {
  final String title;
  final String description;
  final bool isCompleted;
  final BadgeViewModel? badge; // para o componente Badge

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
    this.badge,
  });

  Task copyWith({bool? isCompleted}) => Task(
        title: this.title,
        description: this.description,
        isCompleted: isCompleted ?? this.isCompleted,
        badge: this.badge,
      );
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  int _selectedIndex = 0; // 0: Pendentes, 1: Concluídas
  final List<Task> _tasks = [
    Task(
      title: 'Tarefa 1',
      description: 'Descrição da tarefa 1',
      badge: BadgeViewModel(style: BadgeStyle.error, text: 'Alta', icon: Icon(Icons.error, color: Colors.red,)),
      isCompleted: false,
    ),
    Task(
      title: 'Tarefa 2',
      description: 'Descrição da tarefa 2',
      badge: BadgeViewModel(style: BadgeStyle.success, text: 'baixa',
          icon: Icon(
            Icons.error,
            color: Color(0x00CD51),
          )),
      isCompleted: true,
    ),
    Task(
        title: 'Tarefa 3',
        description: 'Descrição da tarefa 3',
        badge: BadgeViewModel(style: BadgeStyle.warning, text: 'Média',
          icon: Icon(
            Icons.error,
            color: Colors.yellow,
          )),
        isCompleted: false,
    ),
        
  ];

  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index] =
          _tasks[index].copyWith(isCompleted: !_tasks[index].isCompleted);
    });
  }

  List<Task> _getFilteredTasks() {
    if (_selectedIndex == 0) {
      return _tasks.where((task) => !task.isCompleted).toList();
    } else {
      return _tasks.where((task) => task.isCompleted).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredTasks = _getFilteredTasks();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Manter a cor branca
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Colors.black), // Botão de voltar
          onPressed: () =>
              Navigator.of(context).pop(), // Navega para a página anterior
        ),
      ),
      backgroundColor: Colors.white, // Define a cor de fundo da tela
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  
                  padding: EdgeInsets.only(bottom: 24, ),
                  child: Text(
                    'TAREFAS',
                    style: AppTextStyle.createTextStyle(
                        AppTextStyle.navigationLarge, Color(0xFF002752)),
                  ),
                ),
              ],
            ),
            Segmented.instantiate(
              viewModel: SegmentedViewModel(
                labels: ['Pendentes', 'Concluídas'],
                selectedIndex: _selectedIndex,
                onSelectedIndexChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredTasks.length,
                itemBuilder: (context, index) {
                  final task = filteredTasks[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CardOption.instantiate(
                      viewModel: CardOptionViewModel(
                        title: task.title,
                        description: task.description,
                        badge: task.badge,
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(bottom: 8), 
                          child: CustomCheckbox.instantiate(
                            viewModel: CheckboxViewModel(
                              value: task.isCompleted,
                              shape: CheckboxShape.square, 
                              state: CheckboxState.enabled,
                              onChanged: (value) {
                                setState(() {
                                  final taskIndex = _tasks.indexOf(task);
                                  _tasks[taskIndex] = _tasks[taskIndex]
                                      .copyWith(isCompleted: value);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                style: ActionButtonStyle.primary,
                size: ActionButtonSize.small,
                text: 'Criar Nova Tarefa',
                onPressed: () {
                 
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
