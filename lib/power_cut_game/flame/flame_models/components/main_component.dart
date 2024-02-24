import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/city_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/control_panel/control_panel_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/sky/sky_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/water/water_main_component.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class MainComponent extends PositionComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;
  double _sizeFactor = 1;

  @override
  FutureOr<void> onLoad() {
    add(SkyMainComponent());
    add(WaterMainComponent());
    add(ControlPanelMainComponent());
    add(CityComponent());

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    _cVModel
      ..screenW = size.x
      ..screenH = size.y

      /// Calculating height boundaries for positioning layers
      ..currentEdgeHeight = _cVModel.screenH > _cVModel.minScreenHeight
          ? _cVModel.screenH
          : _cVModel.minScreenHeight;

    /// Determining the minimum size of one side of the screen
    final minLength = _cVModel.screenW > _cVModel.currentEdgeHeight
        ? _cVModel.currentEdgeHeight
        : _cVModel.screenW;

    ///  Calculate scale
    _cVModel.scale = minLength / _cVModel.minScreenWidth;

    /// Determining whether the screen is currently increasing or decreasing
    final screenFactor = size.x / size.y;
    if (screenFactor > _sizeFactor) {
      _cVModel.screenResizeType = ScreenResize.increase;
    } else if (screenFactor < _sizeFactor) {
      _cVModel.screenResizeType = ScreenResize.decrease;
    } else {
      _cVModel.screenResizeType = ScreenResize.none;
    }

    /// Additional call to calculate dimensions
    /// Fixes incorrect behavior for the browser when the screen size changes suddenly
    if (_sizeFactor != screenFactor) {
      _sizeFactor = screenFactor;
      onGameResize(Vector2(_cVModel.screenW, _cVModel.screenH));
    }
  }
}
