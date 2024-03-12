import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/power_cut_game_menu.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/overlays/main_menu_overlay.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/overlays/tutorial_overlay.dart';

class GamePageMenu extends StatefulWidget {
  const GamePageMenu({super.key});

  @override
  State<GamePageMenu> createState() => _GamePageMenuState();
}

class _GamePageMenuState extends State<GamePageMenu> {
  final PowerCutGameMenu _powerCutGameMenu = PowerCutGameMenu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GameWidget(
          game: _powerCutGameMenu,
          overlayBuilderMap: {
            MainMenuOverlay.overlayName: (context, game) =>
                MainMenuOverlay(_powerCutGameMenu),
            TutorialOverlay.overlayName: (context, game) =>
                TutorialOverlay(_powerCutGameMenu),
          },
        ),
      ),
    );
  }
}
