import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum BB4BuildingType {
  bb4_0(0, 0),
  bb4_1(8, 53),
  bb4_2(230, 115),
  bb4_3(326, 163),
  bb4_4(400, 200),
  bb4_5(482, 241);

  const BB4BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case BB4BuildingType.bb4_0:
        return cVModel.empty;
      case BB4BuildingType.bb4_1:
        return cVModel.bb4_1;
      case BB4BuildingType.bb4_2:
        return cVModel.bb4_2;
      case BB4BuildingType.bb4_3:
        return cVModel.bb4_3;
      case BB4BuildingType.bb4_4:
        return cVModel.bb4_4;
      case BB4BuildingType.bb4_5:
        return cVModel.bb4_5;
    }
  }
}
