import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(top: BorderSide(color: theme.dividerColor, width: 0.5)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Social icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook),
                onPressed: () {},
                tooltip: 'Facebook',
                color: theme.colorScheme.primary,
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
                tooltip: 'Paramètres',
                color: theme.colorScheme.primary,
              ),
              IconButton(
                icon: const Icon(Icons.whatshot),
                onPressed: () {},
                tooltip: 'Tendances',
                color: theme.colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '© 2025 LeloStore — Tous droits réservés',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
