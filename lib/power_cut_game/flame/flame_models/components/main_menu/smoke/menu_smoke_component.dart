import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class MenuSmokeComponent extends SpriteComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;

  @override
  FutureOr<void> onLoad() async {
    size = Vector2(_cVModel.smokeSize, _cVModel.smokeSize);
    sprite = _cVModel.menuSmoke1;
    anchor = Anchor.topCenter;
    return super.onLoad();
  }
}
