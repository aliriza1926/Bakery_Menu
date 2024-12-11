import 'package:flutter/material.dart';
import '../core/themes.dart';

class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  HomeScreen({required this.isDarkMode, required this.onThemeToggle});

  final items = {
    'Yiyecekler': [
      {'name': 'Açma', 'image': 'acma.jpg', 'price': 15.0},
      {'name': 'Poğaça', 'image': 'pogaca.jpg', 'price': 18.0},
      {'name': 'Simit', 'image': 'simit.jpg', 'price': 12.0},
      {'name': 'Pide', 'image': 'kirpidesi.jpg', 'price': 25.0},
      {'name': 'Su Böreği', 'image': 'suboregi.jpg', 'price': 60.0},
    ],
    'İçecekler': [
      {'name': 'Su', 'image': 'su.jpg', 'price': 5.0},
      {'name': 'Çay', 'image': 'cay.jpg', 'price': 10.0},
      {'name': 'Kahve', 'image': 'kahve.jpg', 'price': 20.0},
      {'name': 'Meyve Suyu', 'image': 'meyvesuyu.jpg', 'price': 15.0},
      {'name': 'Kola', 'image': 'kola.jpg', 'price': 18.0},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fırın Menüsü'),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/icons/moon.png', // Ay simgesi görseli
              width: 24,
              height: 24,
            ),
            onPressed: onThemeToggle, // Temayı değiştiren fonksiyon
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.entries
              .map((entry) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(entry.key),
                      ...entry.value
                          .map((item) => _buildMenuItem(item))
                          .toList(),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppThemes.accent(isDarkMode)),
        ),
      );

  Widget _buildMenuItem(Map<String, dynamic> item) => Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
              child: Image.asset(
                'assets/images/${item['image']}',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[300],
                  child: Icon(Icons.broken_image, size: 40),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppThemes.text(isDarkMode)),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${item['price']} TL',
                    style: TextStyle(
                        color: AppThemes.accent(isDarkMode),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
