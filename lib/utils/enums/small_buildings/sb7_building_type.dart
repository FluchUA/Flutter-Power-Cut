import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum SB7BuildingType {
  sb7_0(0, 0),
  sb7_1(8, 4),
  sb7_2(16, 8),
  sb7_3(22, 11);

  const SB7BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case SB7BuildingType.sb7_0:
        return cVModel.empty;
      case SB7BuildingType.sb7_1:
        return cVModel.sb7_1;
      case SB7BuildingType.sb7_2:
        return cVModel.sb7_2;
      case SB7BuildingType.sb7_3:
        return cVModel.sb7_3;
    }
  }
}
