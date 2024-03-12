import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/big_buildings/bb3_building_type.dart';

class BB3Building extends BaseBuilding {
  BB3BuildingType bb3BuildingType = BB3BuildingType.bb3_0;

  @override
  void turnOf() {
    bb3BuildingType = BB3BuildingType.values[0];
    spriteComponent.sprite = bb3BuildingType.getSprite();
  }

  @override
  void randomLight() {
    bb3BuildingType = BB3BuildingType.values.random();
    spriteComponent.sprite = bb3BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (bb3BuildingType.co2, bb3BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => bb3BuildingType.index > 0;
}
