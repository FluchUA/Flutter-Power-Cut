import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';
import 'package:global_gamers_challenge/utils/enums/day_cycle_type.dart';

class SkyTopComponent extends SpriteComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;
  DayCycleType _currentDayCycleType = DayCycleType.night2;

  @override
  FutureOr<void> onLoad() async {
    size = Vector2(_cVModel.backgroundPartsWidth, _cVModel.gradientHeight);
    sprite = _cVModel.skyNight1;
    anchor = Anchor.bottomCenter;

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    position.y = _cVModel.currentEdgeHeight -
        _cVModel.waterHeight * _cVModel.scale +
        _cVModel.additionalSkyScreenOffset * _cVModel.scale -
        _cVModel.screenOffset * _cVModel.scale;

    scale = Vector2.all(_cVModel.currentEdgeHeight / _cVModel.minScreenWidth);
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);

    if (_cVModel.dayCycleType != _currentDayCycleType) {
      sprite = _cVModel.dayCycleType.getTopSprite();
      _currentDayCycleType = _cVModel.dayCycleType;
    }

    setAlpha(_cVModel.currentAlpha.toInt());
  }
}
