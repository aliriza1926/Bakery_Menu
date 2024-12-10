import 'models.dart';

class BakeryAPI {
  static List<Product> getBakeryItems() {
    return [
      Product(name: 'Açma', imagePath: 'assets/images/acma.jpg', price: 15.0),
      Product(
          name: 'Poğaça', imagePath: 'assets/images/pogaca.jpg', price: 18.0),
      Product(name: 'Simit', imagePath: 'assets/images/simit.jpg', price: 12.0),
      Product(
          name: 'Kır Pidesi',
          imagePath: 'assets/images/kirpidesi.jpg',
          price: 25.0),
    ];
  }

  static List<Product> getDrinkItems() {
    return [
      Product(name: 'Su', imagePath: 'assets/images/su.jpg', price: 5.0),
      Product(name: 'Çay', imagePath: 'assets/images/cay.jpg', price: 10.0),
      Product(name: 'Kahve', imagePath: 'assets/images/kahve.jpg', price: 20.0),
      Product(
          name: 'Meyve Suyu',
          imagePath: 'assets/images/meyvesuyu.jpg',
          price: 15.0),
    ];
  }
}
