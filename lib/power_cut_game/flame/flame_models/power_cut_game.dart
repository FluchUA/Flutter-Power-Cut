import 'dart:async';

import 'package:flame/game.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/overlays/game_interface_overlay.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';
import 'package:global_gamers_challenge/utils/enums/button_type.dart';

class PowerCutGame extends FlameGame {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;

  @override
  FutureOr<void> onLoad() async {
    add(MainComponent());
    overlays.add(GameInterfaceOverlay.overlayName);
    return super.onLoad();
  }

  void onButtonPressed(ButtonType buttonType) {
    switch (buttonType) {
      case ButtonType.left:
        _checkBuildings(_cVModel.smallBuildingsList);
        break;
      case ButtonType.center:
        _checkBuildings(_cVModel.middleBuildingsList);
        break;
      case ButtonType.right:
        _checkBuildings(_cVModel.bigBuildingsList);
        break;
    }
  }

  void _checkBuildings(List<BaseBuilding> buildings) {
    for (final element in buildings) {
      if (element.isTurnOn()) {
        if (!(_cVModel.currentTime > _cVModel.dayStart &&
            _cVModel.currentTime < _cVModel.dayEnd)) {
          _cVModel.dislikesNotifier.value += element.getData().$2;
        }

        element.turnOf();
        break;
      }
    }
  }
}
