import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/water/top_layer/water_top_component.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';
import 'package:global_gamers_challenge/utils/enums/screen_resize.dart';

class WaterTopMainComponent extends PositionComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;
  final List<WaterTopComponent> _waterList = [];

  @override
  FutureOr<void> onLoad() {
    final water = WaterTopComponent();
    add(water);
    _waterList.add(water);

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    final waterWidth = _cVModel.backgroundPartsWidth * _cVModel.scale;

    /// Add/Remove elements
    while ((_waterList.length * waterWidth - 10 < size.x) &&
        size.x > size.y &&
        _cVModel.screenResizeType == ScreenResize.increase) {
      final water1 = WaterTopComponent();
      final water2 = WaterTopComponent();
      _waterList.addAll([water1, water2]);
      addAll([water1, water2]);
    }

    if ((_waterList.length * waterWidth - _cVModel.screenW >= waterWidth * 2) &&
        _cVModel.screenResizeType == ScreenResize.decrease) {
      remove(_waterList.removeAt(0));
      remove(_waterList.removeLast());
    }

    /// Scroll
    for (var i = 0; i < _waterList.length; i++) {
      _waterList[i].position.x = (size.x / 2 + (waterWidth * i)) -
          ((_waterList.length - 1 >= 0 ? _waterList.length - 1 : 0) *
                  waterWidth) *
              0.5;
    }
  }
}
