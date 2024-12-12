import 'package:flutter/material.dart';

import '../../design_system/components/buttons/button/action_button.dart';
import '../../design_system/components/buttons/button/action_button_view_model.dart';
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
  final TextEditingController confirmPasswordController = TextEditingController();
  final SignUpService signUpService = SignUpService();
  final _formKey = GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Adiciona o Form
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: const SizedBox(
                    child: Icon(Icons.task_alt,
                        size: 64, color: Colors.blue)),
              ), 


              _buildNameField(),
              const SizedBox(height: 16),
              _buildEmailField(),
              const SizedBox(height: 16),
              _buildPasswordField(),
              const SizedBox(height: 16),
              _buildConfirmPasswordField(), 
              const SizedBox(height: 32),
              _buildSignUpButton(context),
              const SizedBox(height: 24),
              _buildLoginButton(context), 
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
        controller: nameController,
        placeholder: 'Nome',
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
        placeholder: 'Senha',
        password: true,
        validator: signUpService.validatePassword,
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
        controller: confirmPasswordController,
        placeholder: 'Confirme a Senha',
        password: true,
        validator: (value) {
          if (value != passwordController.text) {
            return 'As senhas não coincidem';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ActionButton.instantiate(
      viewModel: ActionButtonViewModel(
        style: ActionButtonStyle.primary,
        size: ActionButtonSize.medium,
        text: 'Cadastre-se',
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            // Validação do formulário
            try {
              bool isSuccess = await SignUpService.registerUser(
                nameController.text,
                emailController.text,
                passwordController.text,
              );

              if (isSuccess) {
                Navigator.pushReplacementNamed(
                    context, '/login'); // substitui a tela
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
          }
        },
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ActionButton.instantiate(
      viewModel: ActionButtonViewModel(
        size: ActionButtonSize.small,
        style: ActionButtonStyle.text,
        text: 'Login',
        onPressed: () {
          SignUpRouter.goToLogin(context);
        },
      ),
    );
  }
}
