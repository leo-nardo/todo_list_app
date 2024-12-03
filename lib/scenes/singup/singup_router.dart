import 'package:flutter/material.dart';
import '../login/login_view.dart';

class SignUpRouter {
  static void goToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }
}
