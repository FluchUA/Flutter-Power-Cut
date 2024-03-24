import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/middle_buildings/mb1_building_type.dart';

class MB1Building extends BaseBuilding {
  MB1BuildingType mb1BuildingType = MB1BuildingType.mb1_0;

  @override
  void turnOf() {
    mb1BuildingType = MB1BuildingType.values[0];
    spriteComponent.sprite = mb1BuildingType.getSprite();
  }

  @override
  void randomLight() {
    mb1BuildingType = MB1BuildingType.values.random();
    spriteComponent.sprite = mb1BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (mb1BuildingType.co2, mb1BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => mb1BuildingType.index > 0;
}
