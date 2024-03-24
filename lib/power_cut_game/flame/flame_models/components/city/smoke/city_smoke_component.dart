import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class CitySmokeComponent extends SpriteComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;

  @override
  FutureOr<void> onLoad() async {
    size = Vector2(_cVModel.citySmokeSize, _cVModel.citySmokeSize);
    sprite = [_cVModel.menuSmoke1, _cVModel.menuSmoke2, _cVModel.menuSmoke3]
        .random();
    anchor = Anchor.center;
    return super.onLoad();
  }
}
