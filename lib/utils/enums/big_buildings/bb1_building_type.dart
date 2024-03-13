import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum BB1BuildingType {
  bb1_0(0, 0),
  bb1_1(108, 54),
  bb1_2(204, 102),
  bb1_3(276, 138),
  bb1_4(432, 216);

  const BB1BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case BB1BuildingType.bb1_0:
        return cVModel.empty;
      case BB1BuildingType.bb1_1:
        return cVModel.bb1_1;
      case BB1BuildingType.bb1_2:
        return cVModel.bb1_2;
      case BB1BuildingType.bb1_3:
        return cVModel.bb1_3;
      case BB1BuildingType.bb1_4:
        return cVModel.bb1_4;
    }
  }
}
