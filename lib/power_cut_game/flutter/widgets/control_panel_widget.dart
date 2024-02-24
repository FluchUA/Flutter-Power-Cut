import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class ControlPanelWidget extends StatefulWidget {
  const ControlPanelWidget({super.key});

  @override
  State<ControlPanelWidget> createState() => _ControlPanelWidgetState();
}

class _ControlPanelWidgetState extends State<ControlPanelWidget> {
  final CommonValuesModel cVModel = CommonValuesModel.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cVModel.backgroundPartsWidth * cVModel.scale,
      height: cVModel.ctrlPanelHeight * cVModel.scale,
      child: Image.asset('assets/control_panel.png', fit: BoxFit.cover),
    );
  }
}
