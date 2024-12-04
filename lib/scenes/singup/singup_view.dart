import 'package:flutter/material.dart';

import '../../design_system/components/buttons/action_buttom/action_button.dart';
import '../../design_system/components/buttons/action_buttom/action_button_view_model.dart';
import '../../design_system/components/input_field/input_text.dart';
import '../../design_system/components/input_field/input_text_view_model.dart';
import 'singup_router.dart';
import 'singup_service.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SignUpService signUpService = SignUpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildNameField(),
            const SizedBox(height: 16),
            _buildEmailField(),
            const SizedBox(height: 16),
            _buildPasswordField(),
            const SizedBox(height: 32),
            _buildSignUpButton(context),
            const SizedBox(height: 24),
            _buildLoginRedirect(context),
          ],
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
        controller: nameController,
        placeholder: 'Name',
        password: false,
        validator: signUpService.validateName,
      ),
    );
  }

  Widget _buildEmailField() {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
        controller: emailController,
        placeholder: 'E-mail',
        password: false,
        validator: signUpService.validateEmail,
      ),
    );
  }

  Widget _buildPasswordField() {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
        controller: passwordController,
        placeholder: 'Password',
        password: true,
        validator: signUpService.validatePassword,
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ActionButton.instantiate(
      viewModel: ActionButtonViewModel(
        style: ActionButtonStyle.primary,
        size: ActionButtonSize.large,
        text: 'Sign Up',
        onPressed: () async {
          try {
            bool isSuccess = await SignUpService.registerUser(
              nameController.text,
              emailController.text,
              passwordController.text,
            );

            if (isSuccess) {
              SignUpRouter.goToLogin(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Cadastro realizado com sucesso!')),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content:
                        Text('Erro ao realizar cadastro. Tente novamente.')),
              );
            }
          } catch (e) {
            print('Erro ao registrar: $e');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Erro: $e')),
            );
          }
        },
      ),
    );
  }

  Widget _buildLoginRedirect(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SignUpRouter.goToLogin(context);
      },
      child: const Text(
        'Already have an account? Login',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
