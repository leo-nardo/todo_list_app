import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/session_manager.dart';

class TasksService {
  final String baseUrl = "http://127.0.0.1:8080";
  String? _authToken;

  void setAuthToken(String token) {
    _authToken = token;
  }

  bool get isAuthConfigured => _authToken != null;

  // Adiciona o id do usuário ao buscar tarefas
  Future<List<Map<String, dynamic>>> fetchTasks(String userId) async {
    final token = SessionManager.authToken;

    if (token == null) {
      throw Exception("Token de autenticação não encontrado");
    }

    // Inclui o id do usuário na URL
    final response = await http.get(
      Uri.parse('$baseUrl/tasks?userId=$userId'), // Passa o id do usuário
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar tarefas: ${response.statusCode}");
    }

    // Decodifica e retorna a lista de tarefas
    return List<Map<String, dynamic>>.from(json.decode(response.body));
  }

  Future<void> addTask(Map<String, dynamic> task) async {
    _ensureAuthConfigured();

    final response = await http.post(
      Uri.parse('$baseUrl/tasks'),
      headers: {
        'Authorization': 'Bearer $_authToken',
        'Content-Type': 'application/json',
      },
      body: json.encode(task),
    );

    if (response.statusCode != 201) {
      throw Exception(
          'Erro ao adicionar tarefa: ${response.statusCode} - ${response.body}');
    }
  }

  void _ensureAuthConfigured() {
    if (!isAuthConfigured) {
      throw Exception('Token de autenticação não configurado');
    }
  }
}
