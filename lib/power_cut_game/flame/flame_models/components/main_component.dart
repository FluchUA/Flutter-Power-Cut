import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/big_buildings/bb1_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/big_buildings/bb2_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/big_buildings/bb3_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/big_buildings/bb4_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/big_buildings/bb5_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/big_buildings/bb6_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/building_sprite_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/middle_buildings/mb1_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/middle_buildings/mb2_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/middle_buildings/mb3_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/middle_buildings/mb4_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/middle_buildings/mb5_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/middle_buildings/mb6_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/small_buildings/sb1_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/small_buildings/sb2_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/small_buildings/sb3_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/small_buildings/sb4_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/small_buildings/sb5_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/small_buildings/sb6_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/small_buildings/sb7_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/small_buildings/sb8_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/small_buildings/sb9_building.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/city_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/control_panel/control_panel_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/particles/ahs_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/sky/bottom_layer/sky_bottom_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/sky/top_layer/sky_top_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/water/bottom_layer/water_bottom_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/water/top_layer/water_top_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/power_cut_game.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/overlays/game_over_overlay.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';
import 'package:global_gamers_challenge/utils/enums/city_cycle_type.dart';
import 'package:global_gamers_challenge/utils/enums/day_cycle_type.dart';
import 'package:global_gamers_challenge/utils/enums/water_cycle_type.dart';
import 'package:global_gamers_challenge/utils/screen_resize.dart';

class MainComponent extends PositionComponent with HasGameRef<PowerCutGame> {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;
  final ScreenResizeModel _screenResizeModel = ScreenResizeModel.instance;
  WaterCycleType _currentWaterCycleType = WaterCycleType.night1;
  final List<AshComponent> _ashList = [];
  final _factoryComponent = SB1Building()
    ..spriteComponent = BuildingsSpriteComponent();

  @override
  FutureOr<void> onLoad() async {
    _cVModel
      ..gameSpeed = 5
      ..currentTime = 0
      ..isGameOver = false
      ..bigBuildingsList.clear()
      ..middleBuildingsList.clear()
      ..smallBuildingsList.clear();
    _cVModel.dislikesNotifier.value = 0;
    _cVModel.calendarNotifier.value = 1;
    _cVModel.co2Notifier.value = 0;

    add(SkyBottomMainComponent());
    add(SkyTopMainComponent());
    add(WaterBottomMainComponent());
    add(WaterTopMainComponent());
    add(ControlPanelMainComponent());
    add(CityMainComponent());

    /// Big buildings
    _cVModel.bigBuildingsList.addAll([
      BB1Building()..spriteComponent = BuildingsSpriteComponent(),
      BB2Building()..spriteComponent = BuildingsSpriteComponent(),
      BB3Building()..spriteComponent = BuildingsSpriteComponent(),
      BB4Building()..spriteComponent = BuildingsSpriteComponent(),
      BB5Building()..spriteComponent = BuildingsSpriteComponent(),
      BB6Building()..spriteComponent = BuildingsSpriteComponent(),
    ]);

    for (final element in _cVModel.bigBuildingsList) {
      add(element.spriteComponent);
    }

    /// Middle buildings
    _cVModel.middleBuildingsList.addAll([
      MB1Building()..spriteComponent = BuildingsSpriteComponent(),
      MB2Building()..spriteComponent = BuildingsSpriteComponent(),
      MB3Building()..spriteComponent = BuildingsSpriteComponent(),
      MB4Building()..spriteComponent = BuildingsSpriteComponent(),
      MB5Building()..spriteComponent = BuildingsSpriteComponent(),
      MB6Building()..spriteComponent = BuildingsSpriteComponent(),
    ]);

    for (final element in _cVModel.middleBuildingsList) {
      add(element.spriteComponent);
    }

    /// Small buildings
    _cVModel.smallBuildingsList.addAll([
      SB1Building()..spriteComponent = BuildingsSpriteComponent(),
      SB2Building()..spriteComponent = BuildingsSpriteComponent(),
      SB3Building()..spriteComponent = BuildingsSpriteComponent(),
      SB4Building()..spriteComponent = BuildingsSpriteComponent(),
      SB5Building()..spriteComponent = BuildingsSpriteComponent(),
      SB6Building()..spriteComponent = BuildingsSpriteComponent(),
      SB7Building()..spriteComponent = BuildingsSpriteComponent(),
      SB8Building()..spriteComponent = BuildingsSpriteComponent(),
      SB9Building()..spriteComponent = BuildingsSpriteComponent(),
    ]);

    for (final element in _cVModel.smallBuildingsList) {
      add(element.spriteComponent);
    }

    /// Factory
    add(_factoryComponent.spriteComponent);

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    final cVModel = CommonValuesModel.instance;
    if (_screenResizeModel.onScreenResize(size)) {
      onGameResize(Vector2(cVModel.screenW, cVModel.screenH));
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    final edgeValue =
        DayCycleType.values.last.timeEnd - DayCycleType.values.first.timeStart;
    _cVModel.currentTime += _cVModel.gameSpeed * dt;
    if (_cVModel.currentTime >= edgeValue) {
      _cVModel.currentTime -= edgeValue;

      if (!_cVModel.isGameOver) {
        _cVModel.calendarNotifier.value += 1;
        _cVModel.gameSpeed += _cVModel.stepSpeed;
      }
    }

    if (!_cVModel.isGameOver) {
      if (_currentWaterCycleType != _cVModel.waterCycleType) {
        if (!(_cVModel.currentTime > _cVModel.dayStart &&
            _cVModel.currentTime < _cVModel.dayEnd)) {
          for (final element in _cVModel.bigBuildingsList) {
            element.randomLight();
          }

          for (final element in _cVModel.middleBuildingsList) {
            element.randomLight();
          }

          for (final element in _cVModel.smallBuildingsList) {
            element.randomLight();
          }

          _factoryComponent.spriteComponent.sprite = _cVModel.factory;
        } else {
          _factoryComponent.spriteComponent.sprite = _cVModel.empty;
        }

        var co2Sum = 0;
        for (final element in _cVModel.bigBuildingsList) {
          co2Sum += element.getData().$1;
        }

        for (final element in _cVModel.middleBuildingsList) {
          co2Sum += element.getData().$1;
        }

        for (final element in _cVModel.smallBuildingsList) {
          co2Sum += element.getData().$1;
        }

        _cVModel.co2Notifier.value += co2Sum;
        _currentWaterCycleType = _cVModel.waterCycleType;
      }
    }

    /// Sky
    for (final element in DayCycleType.values) {
      if (_cVModel.currentTime >= element.timeStart &&
          _cVModel.currentTime < element.timeEnd) {
        _cVModel
          ..dayCycleType = element
          ..currentAlpha = _calculateAlpha(element.timeEnd - element.timeStart,
              _cVModel.currentTime - element.timeStart);

        break;
      }
    }

    /// Water
    for (final element in WaterCycleType.values) {
      if (_cVModel.currentTime >= element.timeStart &&
          _cVModel.currentTime < element.timeEnd) {
        _cVModel
          ..waterCycleType = element
          ..currentWaterAlpha = _calculateAlpha(
              element.timeEnd - element.timeStart,
              _cVModel.currentTime - element.timeStart);
        break;
      }
    }

    /// City
    for (final element in CityCycleType.values) {
      if (_cVModel.currentTime >= element.timeStart &&
          _cVModel.currentTime < element.timeEnd) {
        _cVModel
          ..cityCycleType = element
          ..currentCityAlpha = _calculateAlpha(
              element.timeEnd - element.timeStart,
              _cVModel.currentTime - element.timeStart);
        break;
      }
    }

    /// Ash
    if (_cVModel.co2Notifier.value > _cVModel.maxCO2ForAsh &&
        _ashList.isEmpty) {
      for (var i = 0; i < _cVModel.ashNumber; i++) {
        _ashList.add(AshComponent());
      }
      addAll(_ashList);
    }

    /// End game
    if (_cVModel.co2Notifier.value > _cVModel.maxCO2) {
      game.overlays.add(GameOverOverlay.overlayName);
      _cVModel
        ..isGameOver = true
        ..gameSpeed = 5;
    }
  }

  double _calculateAlpha(double edgeValue, double currentValue) {
    return ((-255 / edgeValue) * currentValue) + 255;
  }
}
