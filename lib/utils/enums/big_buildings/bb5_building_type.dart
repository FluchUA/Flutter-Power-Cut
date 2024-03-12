import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum BB5BuildingType {
  bb5_0(0, 0),
  bb5_1(8, 100),
  bb5_2(12, 100),
  bb5_3(14, 150),
  bb5_4(20, 200);

  const BB5BuildingType(this.co2, this.dislikes);

  final int co2;
  final int dislikes;

  Sprite getSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case BB5BuildingType.bb5_0:
        return cVModel.empty;
      case BB5BuildingType.bb5_1:
        return cVModel.bb5_1;
      case BB5BuildingType.bb5_2:
        return cVModel.bb5_2;
      case BB5BuildingType.bb5_3:
        return cVModel.bb5_3;
      case BB5BuildingType.bb5_4:
        return cVModel.bb5_4;
    }
  }
}
