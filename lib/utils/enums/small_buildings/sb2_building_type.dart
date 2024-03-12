import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum SB2BuildingType {
  sb2_0(0, 0),
  sb2_1(8, 100),
  sb2_2(12, 100),
  sb2_3(14, 150);

  const SB2BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case SB2BuildingType.sb2_0:
        return cVModel.empty;
      case SB2BuildingType.sb2_1:
        return cVModel.sb2_1;
      case SB2BuildingType.sb2_2:
        return cVModel.sb2_2;
      case SB2BuildingType.sb2_3:
        return cVModel.sb2_3;
    }
  }
}
