import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/big_buildings/bb1_building_type.dart';

class BB1Building extends BaseBuilding {
  BB1BuildingType bb1BuildingType = BB1BuildingType.bb1_0;

  @override
  void turnOf() {
    bb1BuildingType = BB1BuildingType.values[0];
    spriteComponent.sprite = bb1BuildingType.getSprite();
  }

  @override
  void randomLight() {
    bb1BuildingType = BB1BuildingType.values.random();
    spriteComponent.sprite = bb1BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (bb1BuildingType.co2, bb1BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => bb1BuildingType.index > 0;
}
