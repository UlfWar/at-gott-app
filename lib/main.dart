
import 'package:flutter/material.dart';

void main() {
  runApp(const AtGottApp());
}

class AtGottApp extends StatelessWidget {
  const AtGottApp({super.key});

  static const Color forestGreen = Color(0xFF244B38);
  static const Color cream = Color(0xFFF8F5EC);
  static const Color gold = Color(0xFFC6A45C);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ät Gott',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: forestGreen,
          primary: forestGreen,
          secondary: gold,
          surface: cream,
        ),
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      ('Kötträtter', Icons.restaurant, 'Kött'),
      ('Fiskrätter', Icons.set_meal, 'Fisk'),
      ('Vilträtter', Icons.forest, 'Vilt'),
      ('Veganska rätter', Icons.eco, 'Veganskt'),
      ('Grillat', Icons.outdoor_grill, 'Grillat'),
      ('Husmanskost', Icons.soup_kitchen, 'Husmanskost'),
      ('Förrätter', Icons.tapas, 'Förrätter'),
      ('Efterrätter', Icons.cake, 'Efterrätter'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AtGottApp.forestGreen,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Ät Gott',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 18,
              ),
              decoration: BoxDecoration(
                color: AtGottApp.forestGreen,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.restaurant_menu,
                    color: AtGottApp.gold,
                    size: 42,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Välkommen till Ät Gott!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Matglädje, inspiration och goda recept '
                    'för alla tillfällen.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'Våra recept',
              style: TextStyle(
                color: AtGottApp.forestGreen,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.65,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: AtGottApp.gold.withValues(alpha: 0.65),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        category.$2,
                        color: AtGottApp.forestGreen,
                        size: 30,
                      ),
                      const SizedBox(height: 7),
                      Text(
                        category.$1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AtGottApp.forestGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 22),
            _featureCard(
              icon: Icons.auto_awesome,
              title: 'Överraska mig!',
              subtitle: 'Låt Ät Gott skapa en härlig meny.',
            ),
            _featureCard(
              icon: Icons.celebration,
              title: 'Festmeny',
              subtitle: 'Menyförslag för speciella tillfällen.',
            ),
            _featureCard(
              icon: Icons.emoji_events,
              title: 'Matmästaren',
              subtitle: 'Utmana dina matkunskaper!',
            ),
            const SizedBox(height: 18),
            const Center(
              child: Text(
                'Ät Gott – Spis Godt – Guten Appetit – Enjoy Good Food',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AtGottApp.forestGreen,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _featureCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AtGottApp.gold.withValues(alpha: 0.65),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: AtGottApp.forestGreen, size: 32),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AtGottApp.forestGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AtGottApp.gold,
            size: 16,
          ),
        ],
      ),
    );
  }
}
