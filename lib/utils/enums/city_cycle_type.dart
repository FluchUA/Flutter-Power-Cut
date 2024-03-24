import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum CityCycleType {
  night1(0, 20),
  sunrise1(20, 40),
  sunrise2(40, 50),
  day1(50, 70),
  day2(70, 80),
  sunset1(80, 90),
  sunset2(90, 100),
  night2(100, 120),
  night3(120, 140);

  const CityCycleType(this.timeStart, this.timeEnd);

  final double timeStart;
  final double timeEnd;

  Sprite getBottomSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case CityCycleType.night1:
        return cVModel.cityNight;

      case CityCycleType.sunrise1:
        return cVModel.citySunRise1;

      case CityCycleType.sunrise2:
        return cVModel.citySunRise2;

      case CityCycleType.day1:
        return cVModel.cityDay;

      case CityCycleType.day2:
        return cVModel.cityDay;

      case CityCycleType.sunset1:
        return cVModel.citySunRise2;

      case CityCycleType.sunset2:
        return cVModel.citySunRise1;

      case CityCycleType.night2:
        return cVModel.cityNight;

      case CityCycleType.night3:
        return cVModel.cityNight;
    }
  }

  Sprite getTopSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case CityCycleType.night1:
        return cVModel.cityNight;

      case CityCycleType.sunrise1:
        return cVModel.cityNight;

      case CityCycleType.sunrise2:
        return cVModel.citySunRise1;

      case CityCycleType.day1:
        return cVModel.citySunRise2;

      case CityCycleType.day2:
        return cVModel.cityDay;

      case CityCycleType.sunset1:
        return cVModel.cityDay;

      case CityCycleType.sunset2:
        return cVModel.citySunRise2;

      case CityCycleType.night2:
        return cVModel.citySunRise1;

      case CityCycleType.night3:
        return cVModel.cityNight;
    }
  }
}
