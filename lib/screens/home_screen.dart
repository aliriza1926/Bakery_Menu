import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yiyecek & içecek Menüsü'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              // Karanlık / açık tema geçişi için işlevsellik eklenebilir
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Fırın Ürünleri Bölümü
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Yiyecekler',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ),
            // Fırın Ürünleri Listesi
            Column(
              children: [
                _buildMenuItem('Açma', 'assets/images/acma.jpg', 20.0),
                _buildMenuItem('Poğaça', 'assets/images/pogaca.jpg', 25.0),
                _buildMenuItem('Simit', 'assets/images/simit.jpg', 15.0),
                _buildMenuItem(
                    'Kır Pidesi', 'assets/images/kirpidesi.jpg', 35.0),
              ],
            ),
            SizedBox(height: 30),

            // İçecekler Bölümü
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'İçecekler',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            // İçecekler Listesi
            Column(
              children: [
                _buildMenuItem('Su', 'assets/images/su.jpg', 5.0),
                _buildMenuItem('Çay', 'assets/images/cay.jpg', 10.0),
                _buildMenuItem(
                    'Meyve Suyu', 'assets/images/meyvesuyu.jpg', 12.0),
                _buildMenuItem('Kahve', 'assets/images/kahve.jpg', 18.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Menü öğesi oluşturma fonksiyonu
  Widget _buildMenuItem(String name, String imagePath, double price) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Text(
            '\TL${price.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
