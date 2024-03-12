import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum BB3BuildingType {
  bb3_0(0, 0),
  bb3_1(8, 100),
  bb3_2(12, 100),
  bb3_3(14, 150),
  bb3_4(20, 200);

  const BB3BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case BB3BuildingType.bb3_0:
        return cVModel.empty;
      case BB3BuildingType.bb3_1:
        return cVModel.bb3_1;
      case BB3BuildingType.bb3_2:
        return cVModel.bb3_2;
      case BB3BuildingType.bb3_3:
        return cVModel.bb3_3;
      case BB3BuildingType.bb3_4:
        return cVModel.bb3_4;
    }
  }
}
