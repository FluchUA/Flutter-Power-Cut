import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';
import 'package:global_gamers_challenge/utils/enums/water_cycle_type.dart';

class WaterBottomComponent extends SpriteComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;
  WaterCycleType _currentWaterCycleType = WaterCycleType.night1;

  @override
  FutureOr<void> onLoad() async {
    size = Vector2(_cVModel.backgroundPartsWidth, _cVModel.waterHeight);
    sprite = _cVModel.waterNight1;
    anchor = Anchor.topCenter;

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    position.y = _cVModel.currentEdgeHeight -
        _cVModel.waterHeight * _cVModel.scale -
        _cVModel.screenOffset * _cVModel.scale;
    scale = Vector2.all(_cVModel.scale);
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);

    if (_cVModel.waterCycleType != _currentWaterCycleType) {
      sprite = _cVModel.waterCycleType.getBottomSprite();
      _currentWaterCycleType = _cVModel.waterCycleType;
    }
  }
}
