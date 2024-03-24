import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/pages/rive_test_page.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/pages/game_page.dart';
import 'package:global_gamers_challenge/power_cut_game/flutter/pages/power_cut_game_page.dart';

/// I didn’t delete this page so that later I could go and test rive and flutter
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _openGamePage,
          child: const Text('Play'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: _openRiveTestPage,
          child: const Text('Rive test'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: _openFlameTestPage,
          child: const Text('Flame test'),
        ),
      ],
    );
  }

  void _openGamePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PowerCutGamePage()),
    );
  }

  void _openRiveTestPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RiveTestPage()),
    );
  }

  void _openFlameTestPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GamePage()),
    );
  }
}
