import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum MB3BuildingType {
  mb3_0(0, 0),
  mb3_1(16, 8),
  mb3_2(28, 14),
  mb3_3(40, 20);

  const MB3BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case MB3BuildingType.mb3_0:
        return cVModel.empty;
      case MB3BuildingType.mb3_1:
        return cVModel.mb3_1;
      case MB3BuildingType.mb3_2:
        return cVModel.mb3_2;
      case MB3BuildingType.mb3_3:
        return cVModel.mb3_3;
    }
  }
}
