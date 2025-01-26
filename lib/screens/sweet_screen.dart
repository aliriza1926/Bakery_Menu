import 'package:flutter/material.dart';
import 'package:flutter_app/app/themes.dart';
import 'package:flutter_app/views/app_view.dart';
import 'package:provider/provider.dart';

class SweetScreen extends StatelessWidget {
  const SweetScreen({super.key});

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
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              "Tatlılar",
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
                    context, "assets/images/sutlac.jpeg", "Sütlaç", "12 ₺"),
                const SizedBox(height: 10),
                buildFoodItem(
                    context, "assets/images/ekler.jpeg", "Ekler", "18 ₺"),
                const SizedBox(height: 10),
                buildFoodItem(
                    context, "assets/images/trilece.jpeg", "Trileçe", "15 ₺"),
                const SizedBox(height: 10),
                buildFoodItem(
                    context, "assets/images/kruvasan.jpeg", "Kruvasan", "25 ₺"),
                const SizedBox(height: 10),
                buildFoodItem(context, "assets/images/kazandibi.jpeg",
                    "Kazandibi", "60 ₺"),
                const SizedBox(height: 10),
                buildFoodItem(
                    context, "assets/images/donut.jpeg", "Donut", "25 ₺"),
                const SizedBox(height: 10),
                buildFoodItem(
                    context, "assets/images/magnolya.jpeg", "Magnolya", "30 ₺"),
                const SizedBox(height: 10),
                buildFoodItem(
                    context, "assets/images/rulo.jpeg", "Rulo Pasta", "35 ₺"),
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
          const SizedBox(width: 20),
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
                  width: 2,
                  height: 70,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(width: 10),
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
