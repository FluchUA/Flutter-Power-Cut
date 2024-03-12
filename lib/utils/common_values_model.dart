import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/buildings/base_building.dart';
import 'package:global_gamers_challenge/utils/enums/city_cycle_type.dart';
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
  final double cityOffset = 100;

  final double buttonSize = 95;
  final double buttonBottomShift = 10;
  final double buttonHorizontalShift = 140;

  final double minScreenWidth = 500;
  final double minScreenHeight = 250;

  final int minCountBackgroundElements = 3;

  int gameSpeed = 5;
  int stepSpeed = 2;

  double scale = 1;

  double screenW = 0;
  double screenH = 0;
  double currentEdgeHeight = 0;

  int dayStart = 35;
  int dayEnd = 105;
  double currentTime = 0;
  int maxCO2 = 50000;
  bool isGameOver = false;

  ScreenResize screenResizeType = ScreenResize.increase;
  DayCycleType dayCycleType = DayCycleType.night1;
  WaterCycleType waterCycleType = WaterCycleType.night1;
  CityCycleType cityCycleType = CityCycleType.night1;
  double currentAlpha = 0;
  double currentWaterAlpha = 0;
  double currentCityAlpha = 0;

  final List<BaseBuilding> bigBuildingsList = [];
  final List<BaseBuilding> middleBuildingsList = [];
  final List<BaseBuilding> smallBuildingsList = [];

  late ValueNotifier<double> scaleNotifier;
  late ValueNotifier<int> co2Notifier;
  late ValueNotifier<int> calendarNotifier;
  late ValueNotifier<int> dislikesNotifier;

  late Sprite empty;

  late Sprite mainMenuBackground;
  late Sprite mainMenu;

  late Sprite cityDay;
  late Sprite cityNight;
  late Sprite citySunRise1;
  late Sprite citySunRise2;

  late Sprite interfaceCO2;
  late Sprite interfaceCalendar;
  late Sprite interfaceSmile;

  late Sprite controlPanel;
  late Sprite controlPanelButtonOn;
  late Sprite controlPanelButtonOff;

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

  late Sprite factory;

  late Sprite bb1_1;
  late Sprite bb1_2;
  late Sprite bb1_3;
  late Sprite bb1_4;
  late Sprite bb2_1;
  late Sprite bb2_2;
  late Sprite bb2_3;
  late Sprite bb2_4;
  late Sprite bb3_1;
  late Sprite bb3_2;
  late Sprite bb3_3;
  late Sprite bb3_4;
  late Sprite bb4_1;
  late Sprite bb4_2;
  late Sprite bb4_3;
  late Sprite bb4_4;
  late Sprite bb5_1;
  late Sprite bb5_2;
  late Sprite bb5_3;
  late Sprite bb5_4;
  late Sprite bb6_1;
  late Sprite bb6_2;
  late Sprite bb6_3;
  late Sprite bb6_4;

  late Sprite sb1_1;
  late Sprite sb1_2;
  late Sprite sb1_3;
  late Sprite sb2_1;
  late Sprite sb2_2;
  late Sprite sb2_3;
  late Sprite sb3_1;
  late Sprite sb3_2;
  late Sprite sb3_3;
  late Sprite sb4_1;
  late Sprite sb4_2;
  late Sprite sb4_3;
  late Sprite sb5_1;
  late Sprite sb5_2;
  late Sprite sb5_3;
  late Sprite sb6_1;
  late Sprite sb6_2;
  late Sprite sb6_3;
  late Sprite sb7_1;
  late Sprite sb7_2;
  late Sprite sb7_3;
  late Sprite sb8_1;
  late Sprite sb8_2;
  late Sprite sb8_3;
  late Sprite sb9_1;
  late Sprite sb9_2;
  late Sprite sb9_3;

  late Sprite mb1_1;
  late Sprite mb1_2;
  late Sprite mb1_3;
  late Sprite mb2_1;
  late Sprite mb2_2;
  late Sprite mb2_3;
  late Sprite mb3_1;
  late Sprite mb3_2;
  late Sprite mb3_3;
  late Sprite mb4_1;
  late Sprite mb4_2;
  late Sprite mb4_3;
  late Sprite mb5_1;
  late Sprite mb5_2;
  late Sprite mb5_3;
  late Sprite mb6_1;
  late Sprite mb6_2;
  late Sprite mb6_3;
}
