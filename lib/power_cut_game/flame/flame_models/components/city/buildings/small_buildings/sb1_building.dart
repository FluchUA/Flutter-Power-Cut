import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/small_buildings/sb1_building_type.dart';

class SB1Building extends BaseBuilding {
  SB1BuildingType sb1BuildingType = SB1BuildingType.sb1_0;

  @override
  void turnOf() {
    sb1BuildingType = SB1BuildingType.values[0];
    spriteComponent.sprite = sb1BuildingType.getSprite();
  }

  @override
  void randomLight() {
    sb1BuildingType = SB1BuildingType.values.random();
    spriteComponent.sprite = sb1BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (sb1BuildingType.co2, sb1BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => sb1BuildingType.index > 0;
}
