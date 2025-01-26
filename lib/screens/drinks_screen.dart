import 'package:flutter/material.dart';
import 'package:flutter_app/app/themes.dart';
import 'package:flutter_app/views/app_view.dart';
import 'package:provider/provider.dart';

class DrinkScreen extends StatelessWidget {
  const DrinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Provider.of<ThemeProvider>(context).isDarkMode
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: Theme.of(context).colorScheme.onSecondary,
                size: 34,
              ),
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
            ),
          ],
          scrolledUnderElevation: 0,
          toolbarHeight: 75,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(
                top:
                    7), // içecekler yazısını aşşağıya kaydırmak için kullanıyoruz
            child: Text(
              "İçecekler",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Column(
              children: [
                _buildDrinkItem(context, "assets/images/su1.jpg", "Su", "10 ₺"),
                const SizedBox(height: 10),
                _buildDrinkItem(
                    context, "assets/images/cay2.jpg", "Çay", "15 ₺"),
                const SizedBox(height: 10),
                _buildDrinkItem(
                    context, "assets/images/kahve.jpg", "Kahve", "20 ₺"),
                const SizedBox(height: 10),
                _buildDrinkItem(
                    context, "assets/images/meyvesuyu1.jpg", "Cappy", "15 ₺"),
                const SizedBox(height: 10),
                _buildDrinkItem(
                    context, "assets/images/kola.jpg", "Kola", "18 ₺"),
                const SizedBox(height: 10),
                _buildDrinkItem(
                    context, "assets/images/fanta.jpg", "Fanta", "18 ₺"),
                const SizedBox(height: 10),
                _buildDrinkItem(
                    context, "assets/images/sprite.jpg", "Sprite", "18 ₺"),
                const SizedBox(height: 10),
                _buildDrinkItem(
                    context, "assets/images/soda.jpg", "Soda", "10 ₺"),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }

  Widget _buildDrinkItem(
      BuildContext context, String image, String name, String price) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child:
                  Image.asset(image, fit: BoxFit.cover, width: 90, height: 90),
            ),
          ),
          const SizedBox(width: 20), // Fotoğraf ile yazı arasındaki boşluk
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
                Container(
                  width: 2, // Çizginin genişliği
                  height: 70, // Çizginin yüksekliği
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(width: 10), // Çizgi ve fiyat arasındaki boşluk
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    price,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
