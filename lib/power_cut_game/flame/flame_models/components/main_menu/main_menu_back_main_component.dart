import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/main_menu/main_menu_back_component.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';
import 'package:global_gamers_challenge/utils/enums/screen_resize.dart';

class MainMenuBackMainComponent extends PositionComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;
  final List<MainMenuBackComponent> _backgroundList = [];

  @override
  FutureOr<void> onLoad() {
    final background = MainMenuBackComponent();
    add(background);
    _backgroundList.add(background);

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    final backgroundWidth = _cVModel.backgroundPartsWidth * _cVModel.scale;

    /// Add/Remove elements
    while ((_backgroundList.length * backgroundWidth - 10 < size.x) &&
        size.x > size.y &&
        _cVModel.screenResizeType == ScreenResize.increase) {
      final background1 = MainMenuBackComponent();
      final background2 = MainMenuBackComponent();
      _backgroundList.addAll([background1, background2]);
      addAll([background1, background2]);
    }

    if ((_backgroundList.length * backgroundWidth - _cVModel.screenW >=
            backgroundWidth * 2) &&
        _cVModel.screenResizeType == ScreenResize.decrease) {
      remove(_backgroundList.removeAt(0));
      remove(_backgroundList.removeLast());
    }

    /// Scroll
    for (var i = 0; i < _backgroundList.length; i++) {
      _backgroundList[i].position.x = (size.x / 2 + (backgroundWidth * i)) -
          ((_backgroundList.length - 1 >= 0 ? _backgroundList.length - 1 : 0) *
                  backgroundWidth) *
              0.5;
    }
  }
}
