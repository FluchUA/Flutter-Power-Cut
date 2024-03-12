import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class BuildingsSpriteComponent extends SpriteComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;

  @override
  FutureOr<void> onLoad() async {
    size = Vector2(_cVModel.cityWidth, _cVModel.cityHeight);
    sprite = _cVModel.cityNight;
    anchor = Anchor.topCenter;

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    position
      ..x = size.x / 2
      ..y = _cVModel.currentEdgeHeight -
          _cVModel.cityHeight * _cVModel.scale -
          _cVModel.cityOffset * _cVModel.scale -
          _cVModel.additionalCityScreenOffset * _cVModel.scale;
    scale = Vector2.all(_cVModel.scale);
  }
}
