import 'dart:async';

import 'package:flame/game.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/main_component.dart';

class PowerCutGame extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    add(MainComponent());

    // final skillsArtboard =
    //     await loadArtboard(RiveFile.asset('assets/water.riv'));
    // add(TestRiveComponent(skillsArtboard)
    //   ..position = Vector2.zero()
    //   ..size = size);

    return super.onLoad();
  }
}
