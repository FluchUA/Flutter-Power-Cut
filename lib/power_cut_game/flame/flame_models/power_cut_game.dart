import 'dart:async';

import 'package:flame/game.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/main_component.dart';

class PowerCutGame extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    add(MainComponent());

    return super.onLoad();
  }
}
