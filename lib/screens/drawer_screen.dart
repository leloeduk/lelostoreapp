import 'package:flutter/material.dart';
import 'package:lelostore/screens/widgets/showbottomcard.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String selectedCategory = 'Tous';

  final List<String> categories = [
    'Tous',
    'Communication',
    'Météo',
    'Productivité',
    'Utilitaires',
    'Finance',
    'Santé',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.primaryContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/1087/1087840.png',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'LeloStore',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'v1.0.0',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- Menu items ---
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(Icons.home_outlined, 'Accueil', () {
                  Navigator.pop(context);
                }),
                _buildDrawerItem(Icons.category_outlined, 'Catégories', () {
                  Navigator.pop(context);
                  FilterBottomSheet.show(
                    context: context,
                    categories: categories,
                    selectedCategory: selectedCategory,
                    onCategorySelected: (category) {
                      setState(() => selectedCategory = category);
                    },
                  );
                }),
                _buildDrawerItem(
                  Icons.download_outlined,
                  'Mes téléchargements',
                  () {
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  Icons.star_outline,
                  'Applications premium',
                  () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                _buildDrawerItem(Icons.settings_outlined, 'Paramètres', () {
                  Navigator.pop(context);
                }),
                _buildDrawerItem(Icons.info_outline, 'À propos', () {
                  Navigator.pop(context);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, size: 22),
      title: Text(title),
      onTap: onTap,
      horizontalTitleGap: 0,
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }
}
