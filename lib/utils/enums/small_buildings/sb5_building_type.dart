import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum SB5BuildingType {
  sb5_0(0, 0),
  sb5_1(8, 100),
  sb5_2(12, 100),
  sb5_3(14, 150);

  const SB5BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case SB5BuildingType.sb5_0:
        return cVModel.empty;
      case SB5BuildingType.sb5_1:
        return cVModel.sb5_1;
      case SB5BuildingType.sb5_2:
        return cVModel.sb5_2;
      case SB5BuildingType.sb5_3:
        return cVModel.sb5_3;
    }
  }
}
