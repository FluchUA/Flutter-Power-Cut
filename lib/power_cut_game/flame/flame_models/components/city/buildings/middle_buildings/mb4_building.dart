import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/middle_buildings/mb4_building_type.dart';

class MB4Building extends BaseBuilding {
  MB4BuildingType mb4BuildingType = MB4BuildingType.mb4_0;

  @override
  void turnOf() {
    mb4BuildingType = MB4BuildingType.values[0];
    spriteComponent.sprite = mb4BuildingType.getSprite();
  }

  @override
  void randomLight() {
    mb4BuildingType = MB4BuildingType.values.random();
    spriteComponent.sprite = mb4BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (mb4BuildingType.co2, mb4BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => mb4BuildingType.index > 0;
}
