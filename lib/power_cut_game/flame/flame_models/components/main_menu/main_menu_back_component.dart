import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class MainMenuBackComponent extends SpriteComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;

  @override
  FutureOr<void> onLoad() async {
    size = Vector2(_cVModel.mainMenuWidth, _cVModel.mainMenuHeight);
    sprite = _cVModel.mainMenuBackground;
    anchor = Anchor.bottomCenter;

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    position.y = _cVModel.currentEdgeHeight;
    scale = Vector2.all(_cVModel.currentEdgeHeight / _cVModel.minScreenWidth);
  }
}
