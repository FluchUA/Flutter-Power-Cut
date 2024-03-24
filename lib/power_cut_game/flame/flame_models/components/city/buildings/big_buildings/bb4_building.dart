import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/big_buildings/bb4_building_type.dart';

class BB4Building extends BaseBuilding {
  BB4BuildingType bb4BuildingType = BB4BuildingType.bb4_0;

  @override
  void turnOf() {
    bb4BuildingType = BB4BuildingType.values[0];
    spriteComponent.sprite = bb4BuildingType.getSprite();
  }

  @override
  void randomLight() {
    bb4BuildingType = BB4BuildingType.values.random();
    spriteComponent.sprite = bb4BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (bb4BuildingType.co2, bb4BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => bb4BuildingType.index > 0;
}
