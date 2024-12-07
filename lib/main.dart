import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const BakeryMenuApp());
}

class BakeryMenuApp extends StatelessWidget {
  const BakeryMenuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: Consumer<AppState>(
        builder: (context, appState, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pastane Menüsü',
            theme: appState.isDarkMode ? darkTheme : lightTheme,
            locale: appState.currentLocale,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('tr', 'TR'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const BakeryMenuScreen(),
          );
        },
      ),
    );
  }
}

// Tema Ayarları
final ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xFF007BFF),
  scaffoldBackgroundColor: const Color(0xFFF8F9FA),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF007BFF),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
  ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: const Color(0xFF212121),
  scaffoldBackgroundColor: const Color(0xFF303030),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF212121),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
  ),
);

// AppState (Dil ve Tema Yönetimi)
class AppState extends ChangeNotifier {
  bool isDarkMode = false;
  Locale currentLocale = const Locale('tr', 'TR');
  int selectedCategory = 0; // 0: Ürünler, 1: İçecekler

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void toggleLocale() {
    currentLocale = currentLocale.languageCode == 'tr'
        ? const Locale('en', 'US')
        : const Locale('tr', 'TR');
    notifyListeners();
  }

  void setCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }
}

// Menü Ekranı
class BakeryMenuScreen extends StatelessWidget {
  const BakeryMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appState.currentLocale.languageCode == 'tr'
              ? 'Pastane Menüsü'
              : 'Bakery Menu',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              appState.currentLocale.languageCode == 'tr'
                  ? Icons.language
                  : Icons.translate,
            ),
            onPressed: () {
              appState.toggleLocale();
            },
          ),
          IconButton(
            icon: Icon(
              appState.isDarkMode ? Icons.wb_sunny : Icons.nights_stay,
            ),
            onPressed: () {
              appState.toggleTheme();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF007BFF)),
              child: Text(
                appState.currentLocale.languageCode == 'tr'
                    ? 'Kategoriler'
                    : 'Categories',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text(appState.currentLocale.languageCode == 'tr'
                  ? 'Ürünler'
                  : 'Products'),
              onTap: () {
                appState.setCategory(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(appState.currentLocale.languageCode == 'tr'
                  ? 'İçecekler'
                  : 'Drinks'),
              onTap: () {
                appState.setCategory(1);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: appState.selectedCategory == 0
            ? const ProductMenu()
            : const DrinkMenu(),
      ),
    );
  }
}

// Ürünler Menüsü
class ProductMenu extends StatelessWidget {
  const ProductMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        final name = appState.currentLocale.languageCode == 'tr'
            ? item.nameTr
            : item.nameEn;
        return BakeryMenuItemCard(
          item: item,
          textColor: appState.isDarkMode
              ? const Color.fromARGB(255, 235, 88, 88)
              : Colors.black,
          name: name,
        );
      },
    );
  }
}

// İçecekler Menüsü
class DrinkMenu extends StatelessWidget {
  const DrinkMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: drinkItems.length,
      itemBuilder: (context, index) {
        final item = drinkItems[index];
        final name = appState.currentLocale.languageCode == 'tr'
            ? item.nameTr
            : item.nameEn;
        return BakeryMenuItemCard(
          item: item,
          textColor: appState.isDarkMode
              ? const Color.fromARGB(255, 213, 13, 13)
              : Colors.black,
          name: name,
        );
      },
    );
  }
}

// Menü Kartı
class BakeryMenuItemCard extends StatelessWidget {
  final MenuItem item;
  final String name;
  final Color textColor;

  const BakeryMenuItemCard({
    Key? key,
    required this.item,
    required this.name,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Resim Alanı
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: AssetImage(item.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Ürün Adı
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 4),
          // Fiyat
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "${item.price} TL",
              style: const TextStyle(fontSize: 16, color: Color(0xFF007BFF)),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

// Menü Öğeleri
class MenuItem {
  final String nameTr;
  final String nameEn;
  final double price;
  final String imagePath;

  MenuItem({
    required this.nameTr,
    required this.nameEn,
    required this.price,
    required this.imagePath,
  });
}

final List<MenuItem> menuItems = [
  MenuItem(
      nameTr: 'Poğaça',
      nameEn: 'Pogaca',
      price: 20.0,
      imagePath: 'assets/images/pogaca.jpg'),
  MenuItem(
      nameTr: 'Açma',
      nameEn: 'Acma',
      price: 25.0,
      imagePath: 'assets/images/acma.jpg'),
  MenuItem(
      nameTr: 'Simit',
      nameEn: 'Bagel',
      price: 20.0,
      imagePath: 'assets/images/simit.jpg'),
  MenuItem(
      nameTr: 'Kır Pidesi',
      nameEn: 'Country Pita',
      price: 35.0,
      imagePath: 'assets/images/kirpidesi.jpg'),
  MenuItem(
      nameTr: 'Su Böreği',
      nameEn: 'Su Boregi',
      price: 100.0,
      imagePath: 'assets/images/suboregi.jpg'),
  MenuItem(
      nameTr: 'Kol Böreği',
      nameEn: 'Kol Boregi',
      price: 80.0,
      imagePath: 'assets/images/kolboregi.jpg'),
];

final List<MenuItem> drinkItems = [
  MenuItem(
      nameTr: 'Kahve',
      nameEn: 'Coffee',
      price: 25.0,
      imagePath: 'assets/images/kahve.jpg'),
  MenuItem(
      nameTr: 'Çay',
      nameEn: 'Tea',
      price: 15.0,
      imagePath: 'assets/images/cay.jpg'),
  MenuItem(
      nameTr: 'Su',
      nameEn: 'Water',
      price: 5.0,
      imagePath: 'assets/images/su.jpg'),
  MenuItem(
      nameTr: 'Soda',
      nameEn: 'Soda',
      price: 20.0,
      imagePath: 'assets/images/soda.jpg'),
  MenuItem(
      nameTr: 'Kola',
      nameEn: 'Coke',
      price: 35.0,
      imagePath: 'assets/images/kola.jpg'),
  MenuItem(
      nameTr: 'El Yapımı Limonata',
      nameEn: 'Handmade Lemonade',
      price: 35.0,
      imagePath: 'assets/images/limonata.jpg'),
  MenuItem(
      nameTr: 'Meyve Suyu',
      nameEn: 'Fruit juice',
      price: 15.0,
      imagePath: 'assets/images/meyvesuyu.jpg'),
];
