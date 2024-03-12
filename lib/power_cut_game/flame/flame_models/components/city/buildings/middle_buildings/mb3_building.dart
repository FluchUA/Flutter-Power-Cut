import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/middle_buildings/mb3_building_type.dart';

class MB3Building extends BaseBuilding {
  MB3BuildingType mb3BuildingType = MB3BuildingType.mb3_0;

  @override
  void turnOf() {
    mb3BuildingType = MB3BuildingType.values[0];
    spriteComponent.sprite = mb3BuildingType.getSprite();
  }

  @override
  void randomLight() {
    mb3BuildingType = MB3BuildingType.values.random();
    spriteComponent.sprite = mb3BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (mb3BuildingType.co2, mb3BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => mb3BuildingType.index > 0;
}
