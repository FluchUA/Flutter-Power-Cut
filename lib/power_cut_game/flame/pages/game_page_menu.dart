import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/power_cut_game_menu.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/overlays/main_menu_overlay.dart';

class GamePageMenu extends StatelessWidget {
  const GamePageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GameWidget(
          game: PowerCutGameMenu(),
          overlayBuilderMap: {
            MainMenuOverlay.overlayName: (context, game) =>
                const MainMenuOverlay(),
          },
        ),
      ),
    );
  }
}
