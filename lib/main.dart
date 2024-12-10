import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // HomeScreen'ı burada import ediyoruz

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fırın Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(), // Burada HomeScreen'ı gösteriyoruz
    );
  }
}
