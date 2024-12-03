import 'package:flutter/material.dart';

import 'singup_service.dart';
import 'singup_view.dart';

class SignUpFactory {
  static Widget create() {
    final signUpService = SignUpService();
    return const SignUpView();
  }
}
