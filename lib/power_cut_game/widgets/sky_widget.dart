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
    final currentHeight = cVModel.screenH -
        cVModel.waterHeight * cVModel.scale -
        cVModel.screenOffset * cVModel.scale;

    return SizedBox(
      width: cVModel.gradientWidth * cVModel.scale,
      height:
      // cVModel.screenH > cVModel.minScreenSize * 1.5
      //     ?
      currentHeight
          // : cVModel.minScreenSize * 0.5
      ,
      child: Image.asset(
        'assets/1.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
