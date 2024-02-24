import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';
import 'package:global_gamers_challenge/utils/sprite_utils.dart';

class ControlPanelBackgroundComponent extends SpriteComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;

  @override
  FutureOr<void> onLoad() async {
    size = Vector2(_cVModel.backgroundPartsWidth, _cVModel.ctrlPanelHeight);
    sprite = await getSpriteFromAsset('assets/control_panel_background.png');
    anchor = Anchor.topCenter;

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    position.y = _cVModel.currentEdgeHeight -
        _cVModel.ctrlPanelHeight * _cVModel.scale +
        _cVModel.additionalCtrlPanelScreenOffset * _cVModel.scale;
    scale = Vector2.all(_cVModel.scale);
  }
}
