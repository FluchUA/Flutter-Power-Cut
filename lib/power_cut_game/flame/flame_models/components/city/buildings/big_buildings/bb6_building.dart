import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/big_buildings/bb6_building_type.dart';

class BB6Building extends BaseBuilding {
  BB6BuildingType bb6BuildingType = BB6BuildingType.bb6_0;

  @override
  void turnOf() {
    bb6BuildingType = BB6BuildingType.values[0];
    spriteComponent.sprite = bb6BuildingType.getSprite();
  }

  @override
  void randomLight() {
    bb6BuildingType = BB6BuildingType.values.random();
    spriteComponent.sprite = bb6BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (bb6BuildingType.co2, bb6BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => bb6BuildingType.index > 0;
}
