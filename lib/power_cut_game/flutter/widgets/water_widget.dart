import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class WaterWidget extends StatefulWidget {
  const WaterWidget({super.key});

  @override
  State<WaterWidget> createState() => _WaterWidgetState();
}

class _WaterWidgetState extends State<WaterWidget> {
  final CommonValuesModel cVModel = CommonValuesModel.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cVModel.backgroundPartsWidth * cVModel.scale,
      height: cVModel.waterHeight * cVModel.scale,
      child: Image.asset('assets/2.png', fit: BoxFit.cover),
    );
  }
}
