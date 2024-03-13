import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum SB1BuildingType {
  sb1_0(0, 0),
  sb1_1(6, 3),
  sb1_2(10, 5),
  sb1_3(14, 7);

  const SB1BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case SB1BuildingType.sb1_0:
        return cVModel.empty;
      case SB1BuildingType.sb1_1:
        return cVModel.sb1_1;
      case SB1BuildingType.sb1_2:
        return cVModel.sb1_2;
      case SB1BuildingType.sb1_3:
        return cVModel.sb1_3;
    }
  }
}
