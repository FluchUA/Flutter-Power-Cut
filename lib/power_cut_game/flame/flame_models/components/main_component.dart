import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/city_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/control_panel/control_panel.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/sky/bottom_layer/sky_bottom_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/sky/top_layer/sky_top_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/water/bottom_layer/water_bottom_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/water/top_layer/water_top_main_component.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';
import 'package:global_gamers_challenge/utils/enums/day_cycle_type.dart';
import 'package:global_gamers_challenge/utils/enums/water_cycle_type.dart';
import 'package:global_gamers_challenge/utils/screen_resize.dart';

class MainComponent extends PositionComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;
  final ScreenResizeModel _screenResizeModel = ScreenResizeModel.instance;

  double _currentTime = 0;

  @override
  FutureOr<void> onLoad() async {
    add(SkyBottomMainComponent());
    add(SkyTopMainComponent());
    add(WaterBottomMainComponent());
    add(WaterTopMainComponent());
    add(ControlPanelComponent());
    // add(ControlPanelMainComponent());
    add(CityComponent());

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _screenResizeModel.onScreenResize(size);
  }

  @override
  void update(double dt) {
    super.update(dt);

    final edgeValue =
        DayCycleType.values.last.timeEnd - DayCycleType.values.first.timeStart;
    _currentTime += 10 * dt;
    if (_currentTime >= edgeValue) {
      _currentTime -= edgeValue;
    }

    /// Sky
    for (final element in DayCycleType.values) {
      if (_currentTime >= element.timeStart && _currentTime < element.timeEnd) {
        _cVModel
          ..dayCycleType = element
          ..currentAlpha = _calculateAlpha(element.timeEnd - element.timeStart,
              _currentTime - element.timeStart);

        break;
      }
    }

    /// Water
    for (final element in WaterCycleType.values) {
      if (_currentTime >= element.timeStart && _currentTime < element.timeEnd) {
        _cVModel
          ..waterCycleType = element
          ..currentWaterAlpha = _calculateAlpha(
              element.timeEnd - element.timeStart,
              _currentTime - element.timeStart);
        break;
      }
    }
  }

  double _calculateAlpha(double edgeValue, double currentValue) {
    return ((-255 / edgeValue) * currentValue) + 255;
  }
}
