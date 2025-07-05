import 'package:flutter/material.dart';

class FilterBottomSheet extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const FilterBottomSheet({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  static Future<void> show({
    required BuildContext context,
    required List<String> categories,
    required String selectedCategory,
    required ValueChanged<String> onCategorySelected,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => FilterBottomSheet(
            categories: categories,
            selectedCategory: selectedCategory,
            onCategorySelected: onCategorySelected,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: theme.colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Text(
            'Filtrer les applications',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final category = categories[index];
                return ListTile(
                  title: Text(category),
                  trailing:
                      selectedCategory == category
                          ? Icon(Icons.check, color: theme.colorScheme.primary)
                          : null,
                  onTap: () {
                    onCategorySelected(category);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
