import 'dart:async';

import 'package:flame/game.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/main_menu_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/overlays/main_menu_overlay.dart';

class PowerCutGameMenu extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    add(MainMenuComponent());
    overlays.add(MainMenuOverlay.overlayName);

    return super.onLoad();
  }
}
