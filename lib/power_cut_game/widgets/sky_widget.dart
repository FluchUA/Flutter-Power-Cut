import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/models/common_values_model.dart';

class SkyWidget extends StatefulWidget {
  const SkyWidget({super.key});

  @override
  State<SkyWidget> createState() => _SkyWidgetState();
}

class _SkyWidgetState extends State<SkyWidget> {
  final CommonValuesModel cVModel = CommonValuesModel.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cVModel.backgroundPartsWidth * cVModel.scale,
      height: (cVModel.screenH > cVModel.minScreenHeight
              ? cVModel.screenH
              : cVModel.minScreenHeight) -
          cVModel.waterHeight * cVModel.scale -
          cVModel.screenOffset * cVModel.scale,
      child: Image.asset(
        'assets/1.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
