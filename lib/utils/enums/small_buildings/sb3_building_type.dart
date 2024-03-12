import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum SB3BuildingType {
  sb3_0(0, 0),
  sb3_1(8, 100),
  sb3_2(12, 100),
  sb3_3(14, 150);

  const SB3BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case SB3BuildingType.sb3_0:
        return cVModel.empty;
      case SB3BuildingType.sb3_1:
        return cVModel.sb3_1;
      case SB3BuildingType.sb3_2:
        return cVModel.sb3_2;
      case SB3BuildingType.sb3_3:
        return cVModel.sb3_3;
    }
  }
}
