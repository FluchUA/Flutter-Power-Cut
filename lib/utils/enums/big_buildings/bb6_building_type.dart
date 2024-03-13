import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum BB6BuildingType {
  bb6_0(0, 0),
  bb6_1(72, 36),
  bb6_2(110, 55),
  bb6_3(170, 85),
  bb6_4(234, 117);

  const BB6BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case BB6BuildingType.bb6_0:
        return cVModel.empty;
      case BB6BuildingType.bb6_1:
        return cVModel.bb6_1;
      case BB6BuildingType.bb6_2:
        return cVModel.bb6_2;
      case BB6BuildingType.bb6_3:
        return cVModel.bb6_3;
      case BB6BuildingType.bb6_4:
        return cVModel.bb6_4;
    }
  }
}
