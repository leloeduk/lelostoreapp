import 'package:flutter/material.dart';
import 'package:lelostore/models/app_models.dart';
import 'package:lelostore/screens/detail_screen.dart';

class ApplicationCard extends StatelessWidget {
  final Application app;

  const ApplicationCard({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(application: app),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- Icon ---
              Hero(
                tag: app.iconUrl,
                child: Image.network(
                  app.iconUrl,
                  height: 34,
                  width: 34,
                  fit: BoxFit.contain,
                  errorBuilder:
                      (_, __, ___) => const Icon(Icons.android, size: 28),
                ),
              ),
              const SizedBox(height: 6),

              // --- Name ---
              Text(
                app.name,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),

              const SizedBox(height: 2),

              // --- Rating ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, size: 12, color: Colors.amber),
                  const SizedBox(width: 2),
                  Text(
                    app.rating.toString(),
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),

              const SizedBox(height: 4),

              // --- Download Button ---
              SizedBox(
                height: 26,
                child: OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Téléchargement de ${app.name}...'),
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(Icons.download, size: 14),
                  label: const Text(
                    'Télécharger',
                    style: TextStyle(fontSize: 10),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    minimumSize: const Size(0, 26),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
