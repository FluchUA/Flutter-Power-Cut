import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum SB6BuildingType {
  sb6_0(0, 0),
  sb6_1(6, 3),
  sb6_2(8, 4),
  sb6_3(10, 5);

  const SB6BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case SB6BuildingType.sb6_0:
        return cVModel.empty;
      case SB6BuildingType.sb6_1:
        return cVModel.sb6_1;
      case SB6BuildingType.sb6_2:
        return cVModel.sb6_2;
      case SB6BuildingType.sb6_3:
        return cVModel.sb6_3;
    }
  }
}
