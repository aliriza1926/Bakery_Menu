import 'package:flutter/material.dart';
import 'package:flutter_app/views/app_view.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: 75, // Yüksekliği artırdık
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          title: Padding(
            padding:
                const EdgeInsets.only(bottom: 8), // Yazıyı aşağıya kaydırdık
            child: Text(
              "Yiyecekler",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Column(
              children: [
                buildFoodItem(
                    context, "assets/images/simit.jpg", "Simit", "12 ₺"),
                const SizedBox(height: 10),
                buildFoodItem(
                    context, "assets/images/pogaca.jpg", "Poğaça", "18 ₺"),
                const SizedBox(height: 10),
                buildFoodItem(
                    context, "assets/images/acma.jpg", "Açma", "15 ₺"),
                const SizedBox(height: 10),
                buildFoodItem(
                    context, "assets/images/kirpidesi.jpg", "Pide", "25 ₺"),
                const SizedBox(height: 10),
                buildFoodItem(
                    context, "assets/images/suboregi.jpg", "Su Böreği", "60 ₺"),
                const SizedBox(height: 10),
                buildFoodItem(
                    context, "assets/images/tost.jpg", "Tost", "25 ₺"),
                const SizedBox(height: 10),
                buildFoodItem(
                    context, "assets/images/menemen.jpg", "Menemen", "30 ₺"),
                const SizedBox(height: 10),
                buildFoodItem(
                    context, "assets/images/yumurta.jpg", "Yumurta", "35 ₺"),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }

  Widget buildFoodItem(
      BuildContext context, String fotograf, String isim, String fiyat) {
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
              child: Image.asset(fotograf,
                  fit: BoxFit.cover, width: 90, height: 90),
            ),
          ),
          const SizedBox(width: 20), // Fotoğraf ile yazı arasındaki boşluk
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    isim,
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
                  padding: const EdgeInsets.only(right: 40),
                  child: Text(
                    fiyat,
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
