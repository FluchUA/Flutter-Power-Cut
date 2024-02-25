import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/city_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/control_panel/control_panel_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/sky/bottom_layer/sky_bottom_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/sky/top_layer/sky_top_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/water/water_main_component.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';
import 'package:global_gamers_challenge/utils/sprite_utils.dart';

class MainComponent extends PositionComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;
  double _sizeFactor = 1;
  double _currentTime = 0;

  @override
  FutureOr<void> onLoad() async {
    _cVModel
      ..day = await getSpriteFromAsset('assets/test/gradient_day.png')
      ..night = await getSpriteFromAsset('assets/test/gradient_night.png')
      ..sunRise = await getSpriteFromAsset('assets/test/gradient_sun_rise.png');

    add(SkyBottomMainComponent());
    add(SkyTopMainComponent());
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

    /// Removes gaps between elements
    _cVModel.screenW += _cVModel.screenW % 2 == 0 ? 1 : 0;

    /// Additional call to calculate dimensions
    /// Fixes incorrect behavior for the browser when the screen size changes suddenly
    if (_sizeFactor != screenFactor) {
      _sizeFactor = screenFactor;
      onGameResize(Vector2(_cVModel.screenW, _cVModel.screenH));
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    _currentTime += 10 * dt;
    if (_currentTime >= 100) {
      _currentTime -= 100;
    }

    // if (_currentTime >= 0 && _currentTime < 12) {
    //   _cVModel.dayCycleType = DayCycleType.night;
    // } else if (_currentTime >= 12  && _currentTime < 25) {
    //   _cVModel.dayCycleType = DayCycleType.nightToSunRise;
    // } else if (_currentTime >= 25  && _currentTime < 37) {
    //   _cVModel.dayCycleType = DayCycleType.sunRiseToDay;
    // } else if (_currentTime >= 37  && _currentTime < 50) {
    //
    // } else if (_currentTime >= 50  && _currentTime < 62) {
    //
    // } else if (_currentTime >= 62  && _currentTime < 75) {
    //
    // }

    if (_currentTime >= 0 && _currentTime < 25) {
      _cVModel.dayCycleType = DayCycleType.nightToSunRise;
      _cVModel.currentAlpha = (-10.2 * _currentTime) + 255;
    } else if (_currentTime >= 25 && _currentTime < 50) {
      _cVModel.currentAlpha = (-10.2 * (_currentTime - 25)) + 255;
      _cVModel.dayCycleType = DayCycleType.sunRiseToDay;
    } else if (_currentTime >= 50 && _currentTime < 75) {
      _cVModel.dayCycleType = DayCycleType.dayToSunSet;
      _cVModel.currentAlpha = (-10.2 * (_currentTime - 50)) + 255;
    } else if (_currentTime >= 75 && _currentTime < 100) {
      _cVModel.dayCycleType = DayCycleType.sunSetToNight;
      _cVModel.currentAlpha = (-10.2 * (_currentTime - 75)) + 255;
    }

    // log(_cVModel.currentAlpha.toInt().toString());
  }
}
