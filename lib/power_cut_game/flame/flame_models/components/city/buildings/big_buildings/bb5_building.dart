import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/big_buildings/bb5_building_type.dart';

class BB5Building extends BaseBuilding {
  BB5BuildingType bb5BuildingType = BB5BuildingType.bb5_0;

  @override
  void turnOf() {
    bb5BuildingType = BB5BuildingType.values[0];
    spriteComponent.sprite = bb5BuildingType.getSprite();
  }

  @override
  void randomLight() {
    bb5BuildingType = BB5BuildingType.values.random();
    spriteComponent.sprite = bb5BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (bb5BuildingType.co2, bb5BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => bb5BuildingType.index > 0;
}
