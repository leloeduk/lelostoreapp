import 'package:flutter/material.dart';
import 'package:lelostore/models/app_models.dart';
import 'package:lelostore/screens/detail_screen.dart';

class AppSearchDelegate extends SearchDelegate {
  final List<Application> apps;

  AppSearchDelegate(this.apps);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results =
        apps
            .where(
              (app) =>
                  app.name.toLowerCase().contains(query.toLowerCase()) ||
                  app.description.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    return _buildSearchResults(context, results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions =
        query.isEmpty
            ? apps
            : apps
                .where(
                  (app) =>
                      app.name.toLowerCase().contains(query.toLowerCase()) ||
                      app.description.toLowerCase().contains(
                        query.toLowerCase(),
                      ),
                )
                .toList();

    return _buildSearchResults(context, suggestions);
  }

  Widget _buildSearchResults(BuildContext context, List<Application> results) {
    if (results.isEmpty) {
      return const Center(child: Text('Aucune application trouvée.'));
    }

    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final app = results[index];

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              app.iconUrl,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.android, size: 32),
            ),
          ),
          title: Text(app.name),
          subtitle: Text(
            app.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text('${app.size} MB'),
          onTap: () {
            close(context, null);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(application: app),
              ),
            );
          },
        );
      },
    );
  }
}
