import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/small_buildings/sb9_building_type.dart';

class SB9Building extends BaseBuilding {
  SB9BuildingType sb9BuildingType = SB9BuildingType.sb9_0;

  @override
  void turnOf() {
    sb9BuildingType = SB9BuildingType.values[0];
    spriteComponent.sprite = sb9BuildingType.getSprite();
  }

  @override
  void randomLight() {
    sb9BuildingType = SB9BuildingType.values.random();
    spriteComponent.sprite = sb9BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (sb9BuildingType.co2, sb9BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => sb9BuildingType.index > 0;
}
