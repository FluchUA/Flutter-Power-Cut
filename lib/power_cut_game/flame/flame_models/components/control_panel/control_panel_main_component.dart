import 'dart:async';

import 'package:flame/components.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/control_panel/buttons/control_panel_center_button.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/control_panel/buttons/control_panel_left_button.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/control_panel/buttons/control_panel_right_button.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/control_panel/control_panel.dart';

class ControlPanelMainComponent extends PositionComponent {
  @override
  FutureOr<void> onLoad() {
    add(ControlPanelComponent());
    add(ControlPanelCenterButtonComponent());
    add(ControlPanelLeftButtonComponent());
    add(ControlPanelRightButtonComponent());

    return super.onLoad();
  }
}
