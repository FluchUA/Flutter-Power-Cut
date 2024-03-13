import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum MB6BuildingType {
  mb6_0(0, 0),
  mb6_1(18, 9),
  mb6_2(32, 16),
  mb6_3(48, 24);

  const MB6BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case MB6BuildingType.mb6_0:
        return cVModel.empty;
      case MB6BuildingType.mb6_1:
        return cVModel.mb6_1;
      case MB6BuildingType.mb6_2:
        return cVModel.mb6_2;
      case MB6BuildingType.mb6_3:
        return cVModel.mb6_3;
    }
  }
}
