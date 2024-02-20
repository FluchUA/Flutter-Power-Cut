import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/models/common_values_model.dart';

class ControlPanelBackgroundWidget extends StatefulWidget {
  const ControlPanelBackgroundWidget({super.key});

  @override
  State<ControlPanelBackgroundWidget> createState() =>
      _ControlPanelBackgroundWidgetState();
}

class _ControlPanelBackgroundWidgetState
    extends State<ControlPanelBackgroundWidget> {
  final CommonValuesModel cVModel = CommonValuesModel.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cVModel.backgroundPartsWidth * cVModel.scale,
      height: cVModel.ctrlPanelHeight * cVModel.scale,
      child:
          Image.asset('assets/control_panel_background.png', fit: BoxFit.cover),
    );
  }
}
