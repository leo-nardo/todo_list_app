import 'package:http/http.dart' as http;
import 'dart:convert';

class TasksService {
  final String baseUrl = "http://127.0.0.1";
  String? _authToken;

  void setAuthToken(String token) {
    _authToken = token;
  }

  Future<List<Map<String, dynamic>>> fetchTasks() async {
    if (_authToken == null) {
      throw Exception('Token de autenticação não configurado');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/tasks'),
      headers: {'Authorization': 'Bearer $_authToken'},
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Erro ao buscar tarefas');
    }
  }

  Future<void> addTask(Map<String, dynamic> task) async {
    if (_authToken == null) {
      throw Exception('Token de autenticação não configurado');
    }

    final response = await http.post(
      Uri.parse('$baseUrl/tasks/'),
      headers: {
        'Authorization': 'Bearer $_authToken',
        'Content-Type': 'application/json',
      },
      body: json.encode(task),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao adicionar tarefa: ${response.body}');
    }
  }
}
