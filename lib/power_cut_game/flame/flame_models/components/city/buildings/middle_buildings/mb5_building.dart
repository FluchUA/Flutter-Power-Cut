import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/middle_buildings/mb5_building_type.dart';

class MB5Building extends BaseBuilding {
  MB5BuildingType mb5BuildingType = MB5BuildingType.mb5_0;

  @override
  void turnOf() {
    mb5BuildingType = MB5BuildingType.values[0];
    spriteComponent.sprite = mb5BuildingType.getSprite();
  }

  @override
  void randomLight() {
    mb5BuildingType = MB5BuildingType.values.random();
    spriteComponent.sprite = mb5BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (mb5BuildingType.co2, mb5BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => mb5BuildingType.index > 0;
}
