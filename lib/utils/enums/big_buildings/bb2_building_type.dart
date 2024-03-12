import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum BB2BuildingType {
  bb2_0(0, 0),
  bb2_1(8, 100),
  bb2_2(12, 100),
  bb2_3(14, 150),
  bb2_4(20, 200);

  const BB2BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case BB2BuildingType.bb2_0:
        return cVModel.empty;
      case BB2BuildingType.bb2_1:
        return cVModel.bb2_1;
      case BB2BuildingType.bb2_2:
        return cVModel.bb2_2;
      case BB2BuildingType.bb2_3:
        return cVModel.bb2_3;
      case BB2BuildingType.bb2_4:
        return cVModel.bb2_4;
    }
  }
}
