import 'package:flutter/material.dart';

import 'login_service.dart';
import 'login_view.dart';

class LoginFactory {
  static Widget create() {
    final loginService = LoginService();
    return LoginView();
  }
}
