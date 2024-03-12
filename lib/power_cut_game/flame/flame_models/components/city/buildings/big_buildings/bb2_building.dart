import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/big_buildings/bb2_building_type.dart';

class BB2Building extends BaseBuilding {
  BB2BuildingType bb2BuildingType = BB2BuildingType.bb2_0;

  @override
  void turnOf() {
    bb2BuildingType = BB2BuildingType.values[0];
    spriteComponent.sprite = bb2BuildingType.getSprite();
  }

  @override
  void randomLight() {
    bb2BuildingType = BB2BuildingType.values.random();
    spriteComponent.sprite = bb2BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (bb2BuildingType.co2, bb2BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => bb2BuildingType.index > 0;
}
