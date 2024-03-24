import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum SB8BuildingType {
  sb8_0(0, 0),
  sb8_1(6, 3),
  sb8_2(12, 6),
  sb8_3(16, 8);

  const SB8BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case SB8BuildingType.sb8_0:
        return cVModel.empty;
      case SB8BuildingType.sb8_1:
        return cVModel.sb8_1;
      case SB8BuildingType.sb8_2:
        return cVModel.sb8_2;
      case SB8BuildingType.sb8_3:
        return cVModel.sb8_3;
    }
  }
}
