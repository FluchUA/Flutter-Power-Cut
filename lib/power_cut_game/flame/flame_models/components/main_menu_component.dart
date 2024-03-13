import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/main_menu/main_menu_back_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/main_menu/main_menu_component.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';
import 'package:global_gamers_challenge/utils/screen_resize.dart';

class MainMenuComponent extends PositionComponent {
  final ScreenResizeModel _screenResizeModel = ScreenResizeModel.instance;

  @override
  FutureOr<void> onLoad() async {
    add(MainMenuBackMainComponent());
    add(MainMenuCenterComponent());
    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    final cVModel = CommonValuesModel.instance;
    if (_screenResizeModel.onScreenResize(size)) {
      onGameResize(Vector2(cVModel.screenW, cVModel.screenH));
    }
  }
}
