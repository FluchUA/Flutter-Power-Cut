import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/small_buildings/sb3_building_type.dart';

class SB3Building extends BaseBuilding {
  SB3BuildingType sb3BuildingType = SB3BuildingType.sb3_0;

  @override
  void turnOf() {
    sb3BuildingType = SB3BuildingType.values[0];
    spriteComponent.sprite = sb3BuildingType.getSprite();
  }

  @override
  void randomLight() {
    sb3BuildingType = SB3BuildingType.values.random();
    spriteComponent.sprite = sb3BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (sb3BuildingType.co2, sb3BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => sb3BuildingType.index > 0;
}
