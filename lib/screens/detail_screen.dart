import 'package:flutter/material.dart';
import 'package:lelostore/models/app_models.dart';

class DetailScreen extends StatelessWidget {
  final Application application;

  const DetailScreen({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280.0,
            pinned: true,
            elevation: 0,
            backgroundColor: theme.colorScheme.surface,
            iconTheme: IconThemeData(color: theme.colorScheme.onSurface),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                application.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    application.screenshots.isNotEmpty
                        ? application.screenshots.first
                        : application.iconUrl,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            Container(color: theme.colorScheme.surfaceVariant),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black54, Colors.transparent],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Fonctionnalité de partage en développement',
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),
            ],
          ),

          // --- Contenu principal ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// --- En-tête avec logo, nom, rating ---
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: application.iconUrl,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            application.iconUrl,
                            width: 72,
                            height: 72,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) => Container(
                                  width: 72,
                                  height: 72,
                                  color: theme.colorScheme.surfaceVariant,
                                  child: const Icon(Icons.android, size: 36),
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              application.name,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              application.category,
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.star, size: 18, color: Colors.amber),
                                const SizedBox(width: 4),
                                Text(
                                  '${application.rating}',
                                  style: theme.textTheme.bodyMedium,
                                ),
                                const SizedBox(width: 16),
                                Icon(
                                  Icons.download,
                                  size: 18,
                                  color: theme.colorScheme.primary,
                                ),
                                const SizedBox(width: 4),
                                Text('10K+', style: theme.textTheme.bodyMedium),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  /// --- Description ---
                  Text(
                    'À propos',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    application.description,
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 28),

                  /// --- Screenshots ---
                  if (application.screenshots.isNotEmpty) ...[
                    Text(
                      'Captures d\'écran',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: application.screenshots.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              application.screenshots[index],
                              width: 110,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (_, __, ___) => Container(
                                    width: 110,
                                    height: 180,
                                    color: theme.colorScheme.surfaceVariant,
                                    child: const Icon(Icons.broken_image),
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 28),
                  ],

                  /// --- Détails table ---
                  Text(
                    'Détails',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildDetailRow(context, 'Version', application.version),
                  _buildDetailRow(context, 'Taille', '${application.size} MB'),
                  _buildDetailRow(context, 'Mise à jour', 'Il y a 2 semaines'),
                  _buildDetailRow(context, 'Développeur', 'Lelo Technologies'),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),

      /// --- Bouton INSTALLER en bas ---
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Téléchargement de ${application.name}...'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: const Icon(Icons.download, size: 20),
            label: const Text(
              'Installer',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            style: FilledButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// --- Fonction pour les lignes de détails ---
  Widget _buildDetailRow(BuildContext context, String label, String value) {
    final style = Theme.of(context).textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: style?.copyWith(color: Colors.grey)),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(value, style: style)),
        ],
      ),
    );
  }
}
