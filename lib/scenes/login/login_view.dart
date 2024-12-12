import 'package:flutter/material.dart';
import 'package:todolist_app/scenes/singup/singup_view.dart';

import '../../core/session_manager.dart';
import '../../design_system/components/buttons/action_buttom/action_button.dart';
import '../../design_system/components/buttons/action_buttom/action_button_view_model.dart';
import '../../design_system/components/input_field/input_text.dart';
import '../../design_system/components/input_field/input_text_view_model.dart';
import '../../design_system/components/linked_label/linked_label.dart';
import '../../design_system/components/linked_label/linked_label_view_model.dart';
import 'login_router.dart';
import 'login_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginService loginService = LoginService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLogo(),
              const SizedBox(height: 64),
              _buildEmailField(),
              const SizedBox(height: 16),
              _buildPasswordField(),
              const SizedBox(height: 24),
              _buildForgotPasswordLabel(),
              const SizedBox(height: 24),
              _buildLoginButton(context),
              const SizedBox(height: 96),
              _buildSignUpSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: const Icon(
        Icons.task_alt, // Escolha o ícone desejado
        size: 128, // Ajuste o tamanho do ícone
        color: Colors.blue, // Personalize a cor do ícone
      ),
    );
  }


  Widget _buildEmailField() {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
        controller: emailController,
        placeholder: 'E-mail',
        password: false,
        validator: loginService.validateEmail,
      ),
    );
  }

  Widget _buildPasswordField() {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
        controller: passwordController,
        placeholder: 'Password',
        password: true,
        suffixIcon: const Icon(Icons.remove_red_eye),
        validator: loginService.validatePassword,
      ),
    );
  }

  Widget _buildForgotPasswordLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LinkedLabel.instantiate(
          viewModel: LinkedLabelViewModel(
            fullText: 'Forgot Password',
            linkedText: 'Forgot Password',
            onLinkTap: () {
              print('Esqueceu a senha?');
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ActionButton.instantiate(
      viewModel: ActionButtonViewModel(
        style: ActionButtonStyle.primary,
        size: ActionButtonSize.large,
        text: 'Login',
        onPressed: () async {
            try {
              final response = await loginService.login(
                  emailController.text, passwordController.text);
              final authToken = response['token'];
              SessionManager.setAuthToken(authToken); // Armazena o token

              // Chama diretamente a navegação com o token
              LoginRouter.goToTasks(context, authToken);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erro: ${e.toString()}')));
            }
          }
      ),
    );
  }


  Widget _buildSignUpSection(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Don\'t Have An Account?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 73,
          child: ActionButton.instantiate(
            viewModel: ActionButtonViewModel(
              style: ActionButtonStyle.primary,
              size: ActionButtonSize.small,
              text: 'Sign Up',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUpView()));
              },
            ),
          ),
        ),
      ],
    );
  }
}
