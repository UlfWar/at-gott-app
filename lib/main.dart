
import 'package:flutter/material.dart';

void main() {
  runApp(const AtGottApp());
}

class AtGottApp extends StatelessWidget {
  const AtGottApp({super.key});

  static const Color forestGreen = Color(0xFF244B38);
  static const Color cream = Color(0xFFFFF8F0);
  static const Color gold = Color(0xFFC6A45C);
  static const Color darkGreen = Color(0xFF183526);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ät Gott',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: forestGreen,
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

  static const Color green = AtGottApp.forestGreen;
  static const Color cream = AtGottApp.cream;
  static const Color gold = AtGottApp.gold;

  final List<Map<String, dynamic>> categories = const [
    {'name': 'Kötträtter', 'icon': Icons.restaurant},
    {'name': 'Fiskrätter', 'icon': Icons.set_meal},
    {'name': 'Vilträtter', 'icon': Icons.forest},
    {'name': 'Veganskt', 'icon': Icons.eco},
    {'name': 'Grillat', 'icon': Icons.outdoor_grill},
    {'name': 'Husmanskost', 'icon': Icons.soup_kitchen},
    {'name': 'Förrätter', 'icon': Icons.tapas},
    {'name': 'Efterrätter', 'icon': Icons.cake},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 18, 22, 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.restaurant_menu,
                          color: gold,
                          size: 30,
                        ),
                        const Text(
                          'ÄT GOTT',
                          style: TextStyle(
                            color: cream,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.language,
                            color: gold,
                            size: 27,
                          ),
                          tooltip: 'Språk',
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AtGottApp.darkGreen,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: gold, width: 1),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.restaurant,
                            color: gold,
                            size: 42,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Välkommen till Ät Gott',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: cream,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Matglädje, inspiration och goda smaker',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: gold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        Expanded(
                          child: _ActionCard(
                            icon: Icons.shuffle,
                            title: 'Överraska mig',
                            subtitle: 'En slumpad trerättersmeny',
                            onTap: () => _message(
                              context,
                              'Överraska mig kommer snart!',
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _ActionCard(
                            icon: Icons.menu_book,
                            title: 'Festmeny',
                            subtitle: 'Meny för speciella tillfällen',
                            onTap: () => _message(
                              context,
                              'Festmenyer kommer snart!',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Våra recept',
                        style: TextStyle(
                          color: cream,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Välj en kategori och hitta din favorit',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final category = categories[index];
                    return _CategoryCard(
                      title: category['name'] as String,
                      icon: category['icon'] as IconData,
                      onTap: () => _message(
                        context,
                        '${category['name']} öppnas när vi kopplat recepten!',
                      ),
                    );
                  },
                  childCount: categories.length,
                ),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.55,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 25, 18, 25),
                child: _ActionCard(
                  icon: Icons.workspace_premium,
                  title: 'Matmästaren',
                  subtitle: 'Testa dina kunskaper i mat och matlagning!',
                  onTap: () => _message(
                    context,
                    'Matmästarens quiz kommer snart!',
                  ),
                  large: true,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Center(
                  child: Text(
                    'GOD MAT. GODA STUNDER.',
                    style: TextStyle(
                      color: gold.withValues(alpha: 0.9),
                      fontSize: 12,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _message(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AtGottApp.darkGreen,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.large = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AtGottApp.cream,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: EdgeInsets.all(large ? 20 : 14),
          child: Row(
            children: [
              Icon(
                icon,
                color: AtGottApp.forestGreen,
                size: large ? 38 : 30,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: AtGottApp.forestGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AtGottApp.cream,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AtGottApp.forestGreen, size: 30),
              const SizedBox(height: 9),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AtGottApp.forestGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
