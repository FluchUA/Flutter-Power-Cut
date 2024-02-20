import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Global Gamers Challenge',
      home: MenuPage(),
    );
  }
}
