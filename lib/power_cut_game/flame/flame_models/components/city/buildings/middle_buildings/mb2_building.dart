import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/middle_buildings/mb2_building_type.dart';

class MB2Building extends BaseBuilding {
  MB2BuildingType mb2BuildingType = MB2BuildingType.mb2_0;

  @override
  void turnOf() {
    mb2BuildingType = MB2BuildingType.values[0];
    spriteComponent.sprite = mb2BuildingType.getSprite();
  }

  @override
  void randomLight() {
    mb2BuildingType = MB2BuildingType.values.random();
    spriteComponent.sprite = mb2BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (mb2BuildingType.co2, mb2BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => mb2BuildingType.index > 0;
}
