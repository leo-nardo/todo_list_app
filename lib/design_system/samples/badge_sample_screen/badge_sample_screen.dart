import 'package:flutter/material.dart' hide Badge;
import '../../components/badge/badge.dart';
import '../../components/badge/badge_view_model.dart';

class BadgeSampleScreen extends StatelessWidget {
  const BadgeSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final badgeData = [
      BadgeViewModel(
          style: BadgeStyle.success,
          text: 'Sucesso',
          icon: const Icon(Icons.check_circle, color: Colors.green)),
      BadgeViewModel(
          style: BadgeStyle.neutral,
          text: 'Neutro',
          icon: const Icon(Icons.error, color: Colors.grey)),
      BadgeViewModel(
          style: BadgeStyle.error,
          text: 'Erro',
          icon: const Icon(Icons.cancel, color: Colors.red)),
      BadgeViewModel(
          style: BadgeStyle.warning,
          text: 'Aviso',
          icon: const Icon(Icons.error, color: Colors.orange)),
      BadgeViewModel(
          style: BadgeStyle.accent,
          text: 'Acentuado',
          icon: const Icon(Icons.error, color: Colors.green)),
      BadgeViewModel(
          style: BadgeStyle.inverse,
          text: 'Inverso',
          icon: const Icon(Icons.error, color: Colors.grey)),
      BadgeViewModel(
          style: BadgeStyle.success,
          text: 'Sucesso',
          ),
      BadgeViewModel(
          style: BadgeStyle.neutral,
          text: 'Neutro',
          ),
      BadgeViewModel(
          style: BadgeStyle.error,
          text: 'Erro',
          ),
      BadgeViewModel(
          style: BadgeStyle.warning,
          text: 'Aviso',
          ),
      BadgeViewModel(
          style: BadgeStyle.accent,
          text: 'Acentuado',
          ),
      BadgeViewModel(
          style: BadgeStyle.inverse,
          text: 'Inverso',
          ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge Examples'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              for (final data
                  in badgeData) // Usa um for para iterar sobre os dados
                Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Badge.instantiate(viewModel: data)),
            ],
          ),
        ),
      ),
    );
  }
}
