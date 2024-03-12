import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/power_cut_game.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';
import 'package:global_gamers_challenge/utils/enums/button_type.dart';

class ControlPanelLeftButtonComponent extends SpriteComponent
    with TapCallbacks, HasGameRef<PowerCutGame> {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;

  @override
  FutureOr<void> onLoad() async {
    size = Vector2(_cVModel.buttonSize, _cVModel.buttonSize);
    sprite = _cVModel.controlPanelButtonOff;
    anchor = Anchor.topCenter;

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    position
      ..x = size.x / 2 - _cVModel.buttonHorizontalShift * _cVModel.scale
      ..y = _cVModel.currentEdgeHeight -
          _cVModel.buttonSize * _cVModel.scale -
          _cVModel.buttonBottomShift * _cVModel.scale +
          _cVModel.additionalCtrlPanelScreenOffset * _cVModel.scale;
    scale = Vector2.all(_cVModel.scale);
  }

  @override
  void onTapDown(TapDownEvent event) {
    sprite = _cVModel.controlPanelButtonOn;
    game.onButtonPressed(ButtonType.left);
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    sprite = _cVModel.controlPanelButtonOff;
    super.onTapUp(event);
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    sprite = _cVModel.controlPanelButtonOff;
    super.onTapCancel(event);
  }
}
