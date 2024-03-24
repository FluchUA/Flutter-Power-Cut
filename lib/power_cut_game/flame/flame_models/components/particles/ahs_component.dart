import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class AshComponent extends SpriteComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;

  @override
  FutureOr<void> onLoad() async {
    size = Vector2(_cVModel.ashSize, _cVModel.ashSize);
    sprite = _cVModel.ash;
    anchor = Anchor.topCenter;

    position
      ..x = Random().nextInt(_cVModel.screenW.toInt()).toDouble()
      ..y = 0 - Random().nextInt(_cVModel.screenH.toInt()).toDouble();

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += 0.5;

    var currentAlpha = ((-255 / (_cVModel.screenH * 0.5)) * position.y) + 255;
    if (currentAlpha > 255) currentAlpha = 255;
    if (currentAlpha < 0) currentAlpha = 0;
    setAlpha(currentAlpha.toInt());

    if (currentAlpha <= 1) {
      position
        ..x = Random().nextInt(_cVModel.screenW.toInt()).toDouble()
        ..y = 0 - Random().nextInt(_cVModel.screenH.toInt()).toDouble();
    }
  }
}
