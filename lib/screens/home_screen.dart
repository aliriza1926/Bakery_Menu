import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/themes.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).colorScheme.onSecondary,
                size: 34,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          scrolledUnderElevation: 0,
          toolbarHeight: 75,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          title: Text(
            "Zengin Pastane",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(
                  CupertinoIcons.person_circle,
                  size: 50,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              accountName: const Text("Hoşgeldiniz"),
              accountEmail: null,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.food_bank_outlined),
              title: const Text('Yiyecekler'),
              onTap: () => context.push("/food"),
            ),
            ListTile(
              leading: const Icon(
                Icons.wine_bar_outlined,
              ),
              title: const Text('İçecekler'),
              onTap: () => context.push("/drink"),
            ),
            ListTile(
              leading: const Icon(Icons.cake_outlined),
              title: const Text('Tatlılar'),
              onTap: () => context.push("/sweet"),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Yiyecekler",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
              GestureDetector(
                onTap: () => context.push("/food"),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/firinürünleri.jpg',
                      width: 300,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "İçecekler",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
              GestureDetector(
                onTap: () => context.push("/drink"),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/icecekleranaekran.jpg',
                      width: 300,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Tatlılar",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
              GestureDetector(
                onTap: () => context.push("/sweet"),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/tatligenel.jpeg',
                      width: 300,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 3),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70, // Alt kısmın yüksekliği
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary, // Arka plan rengi
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Center(
          child: Text(
            "Hoş Geldiniz!",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
        ),
      ),
    );
  }
}
