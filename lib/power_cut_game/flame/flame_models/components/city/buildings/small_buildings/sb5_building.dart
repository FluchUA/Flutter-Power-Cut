import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/small_buildings/sb5_building_type.dart';

class SB5Building extends BaseBuilding {
  SB5BuildingType sb5BuildingType = SB5BuildingType.sb5_0;

  @override
  void turnOf() {
    sb5BuildingType = SB5BuildingType.values[0];
    spriteComponent.sprite = sb5BuildingType.getSprite();
  }

  @override
  void randomLight() {
    sb5BuildingType = SB5BuildingType.values.random();
    spriteComponent.sprite = sb5BuildingType.getSprite();
  }

  @override
  (int, int) getData() {
    return (sb5BuildingType.co2, sb5BuildingType.dislikes);
  }

  @override
  bool isTurnOn() => sb5BuildingType.index > 0;
}
