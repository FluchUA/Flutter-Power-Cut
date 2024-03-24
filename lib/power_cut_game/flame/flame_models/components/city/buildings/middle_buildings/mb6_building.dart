import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/middle_buildings/mb6_building_type.dart';

class MB6Building extends BaseBuilding {
  MB6BuildingType mb6BuildingType = MB6BuildingType.mb6_0;

  @override
  void turnOf() {
    mb6BuildingType = MB6BuildingType.values[0];
    spriteComponent.sprite = mb6BuildingType.getSprite();
  }

  @override
  void randomLight() {
    mb6BuildingType = MB6BuildingType.values.random();
    spriteComponent.sprite = mb6BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (mb6BuildingType.co2, mb6BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => mb6BuildingType.index > 0;
}
