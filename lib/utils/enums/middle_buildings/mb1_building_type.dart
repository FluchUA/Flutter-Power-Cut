import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum MB1BuildingType {
  mb1_0(0, 0),
  mb1_1(14, 7),
  mb1_2(24, 12),
  mb1_3(40, 20);

  const MB1BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case MB1BuildingType.mb1_0:
        return cVModel.empty;
      case MB1BuildingType.mb1_1:
        return cVModel.mb1_1;
      case MB1BuildingType.mb1_2:
        return cVModel.mb1_2;
      case MB1BuildingType.mb1_3:
        return cVModel.mb1_3;
    }
  }
}
