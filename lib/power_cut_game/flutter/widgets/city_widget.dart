import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class CityWidget extends StatefulWidget {
  const CityWidget({super.key});

  @override
  State<CityWidget> createState() => _CityWidgetState();
}

class _CityWidgetState extends State<CityWidget> {
  final CommonValuesModel cVModel = CommonValuesModel.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cVModel.cityWidth * cVModel.scale,
      height: cVModel.cityHeight * cVModel.scale,
      child: Image.asset('assets/city.png', fit: BoxFit.cover),
    );
  }
}
