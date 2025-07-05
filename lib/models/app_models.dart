class Application {
  final String name;
  final String version;
  final String size;
  final String iconUrl;
  final String description;
  final List<String> screenshots;
  final double rating;
  final String category;

  Application({
    required this.name,
    required this.version,
    required this.size,
    required this.iconUrl,
    required this.description,
    this.screenshots = const [],
    this.rating = 4.0,
    this.category = 'Productivité',
  });
}

final List<Application> applis = [
  Application(
    name: 'Lelo Chat',
    version: '1.2.0',
    size: '12.5',
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/747/747376.png',
    description:
        'Une application de chat simple, rapide et sécurisée. Profitez de messagerie instantanée avec chiffrement de bout en bout, partage de fichiers et appels vocaux de haute qualité. Connectez-vous avec vos amis et collègues sans publicité ni tracking.',
    screenshots: [
      'https://cdn.dribbble.com/users/1230454/screenshots/7012323/media/9c8d476a4b0e439f39b7a7d8b1e5f3a8.png',
      'https://cdn.dribbble.com/users/1230454/screenshots/7012325/media/4c8a3e5c8c9b4e0d8b3e3e5e5e5e5e5e.png',
      'https://cdn.dribbble.com/users/1230454/screenshots/7012327/media/4c8a3e5c8c9b4e0d8b3e3e5e5e5e5e5e.png',
    ],
    rating: 4.5,
    category: 'Communication',
  ),
  Application(
    name: 'Lelo Weather',
    version: '2.0.5',
    size: '8.3',
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/1146/1146869.png',
    description:
        'Prévisions météo locales détaillées avec radar en temps réel. Recevez des alertes météo personnalisées, des prévisions horaires et sur 10 jours. Interface intuitive avec cartes interactives et widgets personnalisables pour votre écran d\'accueil.',
    screenshots: [
      'https://cdn.dribbble.com/users/1230454/screenshots/7012323/media/9c8d476a4b0e439f39b7a7d8b1e5f3a8.png',
      'https://cdn.dribbble.com/users/1230454/screenshots/7012325/media/4c8a3e5c8c9b4e0d8b3e3e5e5e5e5e5e.png',
    ],
    rating: 4.2,
    category: 'Météo',
  ),
  Application(
    name: 'Lelo Notes',
    version: '3.1.1',
    size: '10.2',
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2099/2099058.png',
    description:
        'Prenez des notes rapidement et simplement avec synchronisation cloud. Organisez vos notes avec des tags, recherche optique de texte manuscrit, conversion voix-texte et collaboration en temps réel. Parfait pour les étudiants et professionnels.',
    screenshots: [
      'https://cdn.dribbble.com/users/1230454/screenshots/7012323/media/9c8d476a4b0e439f39b7a7d8b1e5f3a8.png',
    ],
    rating: 4.7,
    category: 'Productivité',
  ),
  Application(
    name: 'Lelo Store',
    version: '1.0.0',
    size: '15.4',
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/1087/1087840.png',
    description:
        'Plateforme pour publier et télécharger des applications APK en toute sécurité. Vérification automatique des virus, système de notation et commentaires, mises à jour automatiques. Découvrez des applications exclusives avant tout le monde.',
    screenshots: [
      'https://cdn.dribbble.com/users/1230454/screenshots/7012323/media/9c8d476a4b0e439f39b7a7d8b1e5f3a8.png',
      'https://cdn.dribbble.com/users/1230454/screenshots/7012325/media/4c8a3e5c8c9b4e0d8b3e3e5e5e5e5e5e.png',
      'https://cdn.dribbble.com/users/1230454/screenshots/7012327/media/4c8a3e5c8c9b4e0d8b3e3e5e5e5e5e5e.png',
    ],
    rating: 4.8,
    category: 'Utilitaires',
  ),
  Application(
    name: 'Lelo Finance',
    version: '1.5.2',
    size: '14.8',
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/3050/3050158.png',
    description:
        'Gérez vos finances personnelles avec des graphiques détaillés, un suivi des dépenses et des budgets personnalisés. Synchronisation bancaire sécurisée, rappels de factures et conseils personnalisés pour économiser de l\'argent.',
    screenshots: [
      'https://cdn.dribbble.com/users/1230454/screenshots/7012323/media/9c8d476a4b0e439f39b7a7d8b1e5f3a8.png',
      'https://cdn.dribbble.com/users/1230454/screenshots/7012325/media/4c8a3e5c8c9b4e0d8b3e3e5e5e5e5e5e.png',
    ],
    rating: 4.6,
    category: 'Finance',
  ),
  Application(
    name: 'Lelo Fitness',
    version: '2.3.0',
    size: '18.6',
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2936/2936886.png',
    description:
        'Suivi d\'activité complet avec plans d\'entraînement personnalisés, suivi nutritionnel et défis communautaires. Compatible avec les bracelets connectés, propose des séances guidées et des analyses détaillées de vos performances.',
    screenshots: [
      'https://cdn.dribbble.com/users/1230454/screenshots/7012323/media/9c8d476a4b0e439f39b7a7d8b1e5f3a8.png',
    ],
    rating: 4.4,
    category: 'Santé',
  ),
];

final List<String> categories = [
  'Tous',
  'Communication',
  'Météo',
  'Productivité',
  'Utilitaires',
  'Finance',
  'Santé',
];
