import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/city_bottom_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/city_top_component.dart';

class CityMainComponent extends PositionComponent {
  @override
  FutureOr<void> onLoad() {
    add(CityBottomComponent());
    add(CityTopComponent());

    return super.onLoad();
  }
}
