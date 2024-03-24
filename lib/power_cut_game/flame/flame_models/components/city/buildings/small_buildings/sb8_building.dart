import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/small_buildings/sb8_building_type.dart';

class SB8Building extends BaseBuilding {
  SB8BuildingType sb8BuildingType = SB8BuildingType.sb8_0;

  @override
  void turnOf() {
    sb8BuildingType = SB8BuildingType.values[0];
    spriteComponent.sprite = sb8BuildingType.getSprite();
  }

  @override
  void randomLight() {
    sb8BuildingType = SB8BuildingType.values.random();
    spriteComponent.sprite = sb8BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (sb8BuildingType.co2, sb8BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => sb8BuildingType.index > 0;
}
