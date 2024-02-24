import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/sky/sky_component.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class SkyMainComponent extends PositionComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;
  final List<SkyComponent> _skyList = [];

  @override
  FutureOr<void> onLoad() {
    final sky = SkyComponent();
    add(sky);
    _skyList.add(sky);

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    final skyWidth = _cVModel.backgroundPartsWidth * _cVModel.scale;

    /// Add/Remove elements
    while ((_skyList.length * skyWidth - 10 < size.x) &&
        size.x > size.y &&
        _cVModel.screenResizeType == ScreenResize.increase) {
      final sky1 = SkyComponent();
      final sky2 = SkyComponent();
      _skyList.addAll([sky1, sky2]);
      addAll([sky1, sky2]);
    }

    if ((_skyList.length * skyWidth - _cVModel.screenW >= skyWidth * 2) &&
        _cVModel.screenResizeType == ScreenResize.decrease) {
      remove(_skyList.removeAt(0));
      remove(_skyList.removeLast());
    }

    /// Scroll
    for (var i = 0; i < _skyList.length; i++) {
      _skyList[i].position.x = (size.x / 2 + (skyWidth * i)) -
          ((_skyList.length - 1 >= 0 ? _skyList.length - 1 : 0) * skyWidth) *
              0.5 -
          i;
    }
  }
}
