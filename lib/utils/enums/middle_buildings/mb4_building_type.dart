import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum MB4BuildingType {
  mb4_0(0, 0),
  mb4_1(8, 100),
  mb4_2(12, 100),
  mb4_3(14, 150);

  const MB4BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case MB4BuildingType.mb4_0:
        return cVModel.empty;
      case MB4BuildingType.mb4_1:
        return cVModel.mb4_1;
      case MB4BuildingType.mb4_2:
        return cVModel.mb4_2;
      case MB4BuildingType.mb4_3:
        return cVModel.mb4_3;
    }
  }
}
