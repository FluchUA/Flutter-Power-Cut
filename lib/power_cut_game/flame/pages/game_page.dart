import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/power_cut_game.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/overlays/game_interface_overlay.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/overlays/game_over_overlay.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GameWidget(
          game: PowerCutGame(),
          overlayBuilderMap: {
            GameInterfaceOverlay.overlayName: (context, game) =>
                const GameInterfaceOverlay(),
            GameOverOverlay.overlayName: (context, game) =>
                const GameOverOverlay(),
          },
        ),
      ),
    );
  }
}
