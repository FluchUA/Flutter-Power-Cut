import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/small_buildings/sb7_building_type.dart';

class SB7Building extends BaseBuilding {
  SB7BuildingType sb7BuildingType = SB7BuildingType.sb7_0;

  @override
  void turnOf() {
    sb7BuildingType = SB7BuildingType.values[0];
    spriteComponent.sprite = sb7BuildingType.getSprite();
  }

  @override
  void randomLight() {
    sb7BuildingType = SB7BuildingType.values.random();
    spriteComponent.sprite = sb7BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (sb7BuildingType.co2, sb7BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => sb7BuildingType.index > 0;
}
