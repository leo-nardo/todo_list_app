import 'package:flutter/material.dart';

enum ActionButtonStyle {
  text, // Botão apenas com texto
  primary,
  secondary,
  ghost,
}

enum ActionButtonSize { small, medium }

class ActionButtonViewModel {
  final ActionButtonSize size;
  final ActionButtonStyle style;
  final String text;
  final IconData? icon;
  final bool enabled; // Adiciona atributo para habilitar/desabilitar
  final VoidCallback onPressed; // <--- CORREÇÃO AQUI

  ActionButtonViewModel({
    required this.size,
    required this.style,
    required this.text,
    this.icon,
    this.enabled = true, // Define o padrão como habilitado
    required this.onPressed, // <--- CORREÇÃO AQUI
  });
}
