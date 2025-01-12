import 'package:flutter/material.dart';
import 'package:flutter_app/app/themes.dart';
import 'package:flutter_app/app/routers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: AppTheme.lighttheme,
    );
  }
}
