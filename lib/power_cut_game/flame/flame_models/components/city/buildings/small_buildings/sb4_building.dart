import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/small_buildings/sb4_building_type.dart';

class SB4Building extends BaseBuilding {
  SB4BuildingType sb4BuildingType = SB4BuildingType.sb4_0;

  @override
  void turnOf() {
    sb4BuildingType = SB4BuildingType.values[0];
    spriteComponent.sprite = sb4BuildingType.getSprite();
  }

  @override
  void randomLight() {
    sb4BuildingType = SB4BuildingType.values.random();
    spriteComponent.sprite = sb4BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (sb4BuildingType.co2, sb4BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => sb4BuildingType.index > 0;
}
