import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum MB5BuildingType {
  mb5_0(0, 0),
  mb5_1(8, 100),
  mb5_2(12, 100),
  mb5_3(14, 150);

  const MB5BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case MB5BuildingType.mb5_0:
        return cVModel.empty;
      case MB5BuildingType.mb5_1:
        return cVModel.mb5_1;
      case MB5BuildingType.mb5_2:
        return cVModel.mb5_2;
      case MB5BuildingType.mb5_3:
        return cVModel.mb5_3;
    }
  }
}
