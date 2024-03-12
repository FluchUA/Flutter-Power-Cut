import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum SB9BuildingType {
  sb9_0(0, 0),
  sb9_1(8, 100),
  sb9_2(12, 100),
  sb9_3(14, 150);

  const SB9BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case SB9BuildingType.sb9_0:
        return cVModel.empty;
      case SB9BuildingType.sb9_1:
        return cVModel.sb9_1;
      case SB9BuildingType.sb9_2:
        return cVModel.sb9_2;
      case SB9BuildingType.sb9_3:
        return cVModel.sb9_3;
    }
  }
}
