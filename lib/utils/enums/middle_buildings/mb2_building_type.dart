import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum MB2BuildingType {
  mb2_0(0, 0),
  mb2_1(10, 5),
  mb2_2(20, 10),
  mb2_3(30, 15);

  const MB2BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case MB2BuildingType.mb2_0:
        return cVModel.empty;
      case MB2BuildingType.mb2_1:
        return cVModel.mb2_1;
      case MB2BuildingType.mb2_2:
        return cVModel.mb2_2;
      case MB2BuildingType.mb2_3:
        return cVModel.mb2_3;
    }
  }
}
