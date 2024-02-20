import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/pages/power_cut_game_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _openGamePage,
        child: const Text('Play'),
      ),
    );
  }

  void _openGamePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PowerCutGamePage()),
    );
  }
}
