import 'package:flutter/material.dart';
import 'package:my_app/widgets/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(foregroundColor: Colors.white),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Widget Dasar',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purpleAccent,
        ),
        body: const MenuPage(),
      ),
    );
  }
}
