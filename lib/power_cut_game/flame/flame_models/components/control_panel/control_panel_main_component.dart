import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/control_panel/control_panel_component_background.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class ControlPanelMainComponent extends PositionComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;
  final List<ControlPanelBackgroundComponent> _ctrlPanelList = [];

  @override
  FutureOr<void> onLoad() {
    final ctrlPanel = ControlPanelBackgroundComponent();
    add(ctrlPanel);
    _ctrlPanelList.add(ctrlPanel);

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    final ctrlPanelWidth = _cVModel.backgroundPartsWidth * _cVModel.scale;

    /// Add/Remove elements
    while (_ctrlPanelList.length * ctrlPanelWidth - 10 < size.x &&
        size.x > size.y &&
        _cVModel.screenResizeType == ScreenResize.increase) {
      final ctrlPanel1 = ControlPanelBackgroundComponent();
      final ctrlPanel2 = ControlPanelBackgroundComponent();
      _ctrlPanelList.addAll([ctrlPanel1, ctrlPanel2]);
      addAll([ctrlPanel1, ctrlPanel2]);
    }

    if (_ctrlPanelList.length * ctrlPanelWidth - _cVModel.screenW >=
            ctrlPanelWidth * 2 &&
        _cVModel.screenResizeType == ScreenResize.decrease) {
      remove(_ctrlPanelList.removeAt(0));
      remove(_ctrlPanelList.removeLast());
    }

    /// Scroll
    for (var i = 0; i < _ctrlPanelList.length; i++) {
      _ctrlPanelList[i].position.x = (size.x / 2 + (ctrlPanelWidth * i)) -
          ((_ctrlPanelList.length - 1 >= 0 ? _ctrlPanelList.length - 1 : 0) *
                  ctrlPanelWidth) *
              0.5 -
          i;
    }
  }
}
