import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/small_buildings/sb6_building_type.dart';

class SB6Building extends BaseBuilding {
  SB6BuildingType sb6BuildingType = SB6BuildingType.sb6_0;

  @override
  void turnOf() {
    sb6BuildingType = SB6BuildingType.values[0];
    spriteComponent.sprite = sb6BuildingType.getSprite();
  }

  @override
  void randomLight() {
    sb6BuildingType = SB6BuildingType.values.random();
    spriteComponent.sprite = sb6BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (sb6BuildingType.co2, sb6BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => sb6BuildingType.index > 0;
}
