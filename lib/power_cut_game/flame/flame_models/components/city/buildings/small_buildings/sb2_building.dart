import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/small_buildings/sb2_building_type.dart';

class SB2Building extends BaseBuilding {
  SB2BuildingType sb2BuildingType = SB2BuildingType.sb2_0;

  @override
  void turnOf() {
    sb2BuildingType = SB2BuildingType.values[0];
    spriteComponent.sprite = sb2BuildingType.getSprite();
  }

  @override
  void randomLight() {
    sb2BuildingType = SB2BuildingType.values.random();
    spriteComponent.sprite = sb2BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (sb2BuildingType.co2, sb2BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => sb2BuildingType.index > 0;
}
