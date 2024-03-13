import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum SB4BuildingType {
  sb4_0(0, 0),
  sb4_1(8, 4),
  sb4_2(14, 7),
  sb4_3(18, 9);

  const SB4BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case SB4BuildingType.sb4_0:
        return cVModel.empty;
      case SB4BuildingType.sb4_1:
        return cVModel.sb4_1;
      case SB4BuildingType.sb4_2:
        return cVModel.sb4_2;
      case SB4BuildingType.sb4_3:
        return cVModel.sb4_3;
    }
  }
}
