import 'package:flutter/material.dart' hide Badge;

import '../../components/badge/badge_view_model.dart';
import '../../components/card_option/card_option.dart';
import '../../components/card_option/card_option_view_model.dart';

class CardOptionSampleScreen extends StatelessWidget {
  const CardOptionSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CardOption Examples')),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            // Card com todas as opções habilitado
            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                description:
                    'Short Description',
                icon: const Icon(Icons.account_circle),
                badge: BadgeViewModel(
                    style: BadgeStyle.success,
                    text: 'Sucesso',
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )),
                trailingWidget: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),

            const SizedBox(height: 16),

            // Card desabilitado
            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                description: 'Short Description',
                icon: const Icon(Icons.account_circle),
                badge: BadgeViewModel(
                    style: BadgeStyle.neutral,
                    text: 'Pausado',
                    icon: Icon(
                      Icons.error,
                      color: Colors.grey,
                    )),
                enabled: false,
              ),
            ),
            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                description:
                    'Short Description',
                icon: const Icon(Icons.account_circle),
                trailingWidget: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),

            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                description: 'Short Description',
                icon: const Icon(Icons.account_circle),
                enabled: false,
              ),
            ),
            const SizedBox(height: 16),
            
            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                icon: const Icon(Icons.account_circle),
                badge: BadgeViewModel(
                    style: BadgeStyle.success,
                    text: 'Sucesso',
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )),
                trailingWidget: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                icon: const Icon(Icons.account_circle),
                badge: BadgeViewModel(
                    style: BadgeStyle.neutral,
                    text: 'Pausado',
                    icon: Icon(
                      Icons.error,
                      color: Colors.grey,
                    )),
                enabled: false,
              ),
            ),
            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                icon: const Icon(Icons.account_circle),
                trailingWidget: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                icon: const Icon(Icons.account_circle),
                enabled: false,
              ),
            ),
            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                description:
                    'Short Description',
                icon: const Icon(Icons.account_circle),
                badge: BadgeViewModel(
                    style: BadgeStyle.success,
                    text: 'Sucesso',
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )),
                trailingWidget: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 16),

            // Card desabilitado
            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                description: 'Short Description',
                icon: const Icon(Icons.account_circle),
                badge: BadgeViewModel(
                    style: BadgeStyle.neutral,
                    text: 'Pausado',
                    icon: Icon(
                      Icons.error,
                      color: Colors.grey,
                    )),
                enabled: false,
              ),
            ),

            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                description: 'Short Description',
                icon: const Icon(Icons.account_circle),
                trailingWidget: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 16),

            // Card desabilitado
            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                description: 'Short Description',
                icon: const Icon(Icons.account_circle),
                enabled: false,
              ),
            ),

            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                description: 'Short Description',
                badge: BadgeViewModel(
                    style: BadgeStyle.success,
                    text: 'Sucesso',
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )),
                trailingWidget: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 16),

            // Card desabilitado
            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                description: 'Short Description',
                badge: BadgeViewModel(
                    style: BadgeStyle.neutral,
                    text: 'Pausado',
                    icon: Icon(
                      Icons.error,
                      color: Colors.grey,
                    )),
                enabled: false,
              ),
            ),
            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                description: 'Short Description',
                trailingWidget: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),

            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                description: 'Short Description',
                enabled: false,
              ),
            ),
            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                badge: BadgeViewModel(
                    style: BadgeStyle.success,
                    text: 'Sucesso',
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )),
                trailingWidget: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                badge: BadgeViewModel(
                    style: BadgeStyle.neutral,
                    text: 'Pausado',
                    icon: Icon(
                      Icons.error,
                      color: Colors.grey,
                    )),
                enabled: false,
              ),
            ),
            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                trailingWidget: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                title: 'Title',
                enabled: false,
              ),
            ),
            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                description: 'Short Description',
                badge: BadgeViewModel(
                    style: BadgeStyle.success,
                    text: 'Sucesso',
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )),
                trailingWidget: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 16),

            // Card desabilitado
            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                description: 'Short Description',
                badge: BadgeViewModel(
                    style: BadgeStyle.neutral,
                    text: 'Pausado',
                    icon: Icon(
                      Icons.error,
                      color: Colors.grey,
                    )),
                enabled: false,
              ),
            ),

            const SizedBox(height: 16),

            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                description: 'Short Description',
                trailingWidget: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 16),

            // Card desabilitado
            CardOption.instantiate(
              viewModel: CardOptionViewModel(
                description: 'Short Description',
                enabled: false,
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
