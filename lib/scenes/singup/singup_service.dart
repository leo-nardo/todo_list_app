import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpService {
  // Validações
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Esse campo é obrigatório';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Insira um e-mail válido';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Esse campo é obrigatório';
    } else if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Esse campo é obrigatório';
    }
    return null;
  }

  // Registro no backend
  static Future<bool> registerUser(
      String name, String email, String password) async {
    const String apiUrl =
        'http://127.0.0.1:8080/users/'; // URL da API

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        print('Usuário registrado com sucesso!');
        return true;
      } else {
        print('Erro ao registrar usuário: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Erro de conexão: $e');
      return false;
    }
  }
}
