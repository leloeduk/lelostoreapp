import 'package:flutter/material.dart';
import 'package:lelostore/models/app_models.dart';
import 'package:lelostore/screens/app_search_delegate.dart';
import 'package:lelostore/screens/application_card.dart';
import 'package:lelostore/screens/drawer_screen.dart';
import 'package:lelostore/screens/widgets/showbottomcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';
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
    final filteredApplis =
        applis.where((app) {
          final matchesSearch =
              app.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              app.description.toLowerCase().contains(searchQuery.toLowerCase());
          final matchesCategory =
              selectedCategory == 'Tous' || app.category == selectedCategory;
          return matchesSearch && matchesCategory;
        }).toList();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Row(
          children: [
            const Icon(Icons.apps, color: Colors.deepPurple),
            const SizedBox(width: 8),
            Text(
              'LeloStore',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: AppSearchDelegate(applis));
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list_alt),
            onPressed: () {
              FilterBottomSheet.show(
                context: context,
                categories: categories,
                selectedCategory: selectedCategory,
                onCategorySelected: (category) {
                  setState(() => selectedCategory = category);
                },
              );
            },
          ),
        ],
      ),
      drawer: DrawerScreen(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: TextField(
              onChanged: (val) => setState(() => searchQuery = val),
              decoration: InputDecoration(
                hintText: 'Rechercher une application...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category;
                return ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(
                      () => selectedCategory = selected ? category : 'Tous',
                    );
                  },
                  selectedColor: Theme.of(context).colorScheme.primary,
                  labelStyle: TextStyle(
                    color:
                        isSelected
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child:
                filteredApplis.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off, size: 72, color: Colors.grey),
                          const SizedBox(height: 16),
                          Text(
                            'Aucune application trouvée',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Essayez une autre recherche ou filtre',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                    : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.builder(
                        itemCount: filteredApplis.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width > 600 ? 6 : 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          final app = filteredApplis[index];
                          return ApplicationCard(app: app);
                        },
                      ),
                    ),
          ),
        ],
      ),
      // bottomNavigationBar: const FooterScreen(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Fonctionnalité à venir : Publier une application'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        icon: const Icon(Icons.upload),
        label: const Text("Publier"),
      ),
    );
  }
}
