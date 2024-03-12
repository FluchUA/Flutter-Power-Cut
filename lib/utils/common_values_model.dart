import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:global_gamers_challenge/utils/enums/day_cycle_type.dart';
import 'package:global_gamers_challenge/utils/enums/screen_resize.dart';
import 'package:global_gamers_challenge/utils/enums/water_cycle_type.dart';

class CommonValuesModel {
  CommonValuesModel._();

  static final CommonValuesModel instance = CommonValuesModel._();

  final double mainMenuWidth = 500;
  final double mainMenuHeight = 500;

  final int screenOffset = 0;
  final int additionalCityScreenOffset = 25;
  final int additionalSkyScreenOffset = 25;
  final int additionalCtrlPanelScreenOffset = 5;

  final double backgroundPartsWidth = 500;
  final double waterHeight = 300;
  final double gradientHeight = 500;
  final double ctrlPanelHeight = 110;

  final double cityWidth = 500;
  final double cityHeight = 250;

  final double minScreenWidth = 500;
  final double minScreenHeight = 250;

  final int minCountBackgroundElements = 3;

  double scale = 1;

  double screenW = 0;
  double screenH = 0;
  double currentEdgeHeight = 0;

  ScreenResize screenResizeType = ScreenResize.none;
  DayCycleType dayCycleType = DayCycleType.night1;
  WaterCycleType waterCycleType = WaterCycleType.night1;
  double currentAlpha = 0;
  double currentWaterAlpha = 0;

  late Sprite mainMenuBackground;
  late Sprite mainMenu;

  late Sprite skyDay;
  late Sprite skyNight1;
  late Sprite skyNight2;
  late Sprite skyNight3;
  late Sprite skyNight4;
  late Sprite skySunRise1_1;
  late Sprite skySunRise1_2;
  late Sprite skySunRise2_1;
  late Sprite skySunRise2_2;
  late Sprite skySunRise3_1;
  late Sprite skySunRise3_2;
  late Sprite skySunRise4;

  late Sprite waterDay1;
  late Sprite waterDay2;
  late Sprite waterDay3;
  late Sprite waterDay4;
  late Sprite waterNight1;
  late Sprite waterNight2;
  late Sprite waterNight3;
  late Sprite waterNight4;
  late Sprite waterSunrise1_1;
  late Sprite waterSunrise1_2;
  late Sprite waterSunrise2_1;
  late Sprite waterSunrise2_2;
  late Sprite waterSunrise3_1;
  late Sprite waterSunrise3_2;
  late Sprite waterSunrise4_1;
  late Sprite waterSunrise4_2;
  late Sprite waterSunset1_1;
  late Sprite waterSunset1_2;
  late Sprite waterSunset2_1;
  late Sprite waterSunset2_2;
  late Sprite waterSunset3_1;
  late Sprite waterSunset3_2;

  late ValueNotifier scaleNotifier;
}
