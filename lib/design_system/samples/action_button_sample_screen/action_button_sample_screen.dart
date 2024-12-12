import 'package:flutter/material.dart';

import '../../components/buttons/button/action_button.dart';
import '../../components/buttons/button/action_button_view_model.dart';

class ActionButtonPage extends StatelessWidget {
  const ActionButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Action Button Examples'),
      ),
      body: SingleChildScrollView(
        // Adiciona SingleChildScrollView para rolagem
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (final size in ActionButtonSize.values)
              _buildButtonSection(size: size),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonSection({required ActionButtonSize size}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          size.name.toUpperCase(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Wrap(
          // Wrap para organizar os botões em múltiplas linhas
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final style in ActionButtonStyle.values)
              ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                  size: size,
                  style: style,
                  text: style.name.toUpperCase(),
                  icon: style != ActionButtonStyle.text ? Icons.add : null,
                  enabled: true,
                  onPressed: () {
                    // Implemente a ação aqui, se necessário.
                    print('Botão ${style.name} pressionado.');
                  },
                ),
              ),
          ],
        ),
        const SizedBox(height: 20), // Espaço entre seções
        Wrap(
          // Wrap para organizar os botões em múltiplas linhas
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final style in ActionButtonStyle.values)
              ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                  size: size,
                  style: style,
                  text: style.name.toUpperCase(),
                  icon: style != ActionButtonStyle.text ? Icons.add : null,
                  enabled: false,
                  onPressed: () {
                    // Implemente a ação aqui, se necessário.
                    print('Botão ${style.name} pressionado (Disabled).');
                  },
                ),
              ),
          ],
        ),
        const SizedBox(height: 20), // Espaço entre seções
      ],
    );
  }
}
