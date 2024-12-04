import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  final String baseUrl = 'http://127.0.0.1:8080';

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Esse campo é obrigatório';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
      return 'E-mail inválido!';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Esse campo é obrigatório';
    }
    return null;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      // Sucesso: Retorna os dados do usuário e o token
      return json.decode(response.body);
    } else {
      // Erro: Lança uma exceção com a mensagem de erro
      final errorResponse = json.decode(response.body);
      throw Exception(errorResponse['message'] ?? 'Erro ao fazer login');
    }
  }
}
