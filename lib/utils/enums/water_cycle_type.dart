import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum WaterCycleType {
  night1(0, 5),
  night2(5, 10),
  sunrise1_1(10, 15),
  sunrise1_2(15, 20),
  sunrise2_1(20, 25),
  sunrise2_2(25, 30),
  sunrise3_1(30, 35),
  sunrise3_2(35, 40),
  sunrise4_1(40, 45),
  sunrise4_2(45, 50),
  sunrise5_1(50, 55),
  sunrise5_2(55, 60),
  day1_1(60, 65),
  day1_2(65, 70),
  day2_1(70, 75),
  day2_2(75, 80),
  sunset1_1(80, 85),
  sunset1_2(85, 90),
  sunset2_1(90, 95),
  sunset2_2(95, 100),
  sunset3_1(100, 105),
  sunset3_2(105, 110),
  sunset4_1(110, 115),
  sunset4_2(115, 120),
  sunset5_1(120, 125),
  sunset5_2(125, 130),
  night3_1(130, 135),
  night3_2(135, 140);

  const WaterCycleType(this.timeStart, this.timeEnd);

  final double timeStart;
  final double timeEnd;

  Sprite getBottomSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case WaterCycleType.night1:
        return cVModel.waterNight1;
      case WaterCycleType.night2:
        return cVModel.waterNight2;
      case WaterCycleType.sunrise1_1:
        return cVModel.waterSunrise1_1;
      case WaterCycleType.sunrise1_2:
        return cVModel.waterSunrise1_2;
      case WaterCycleType.sunrise2_1:
        return cVModel.waterSunrise2_1;
      case WaterCycleType.sunrise2_2:
        return cVModel.waterSunrise2_2;
      case WaterCycleType.sunrise3_1:
        return cVModel.waterSunrise3_1;
      case WaterCycleType.sunrise3_2:
        return cVModel.waterSunrise3_2;
      case WaterCycleType.sunrise4_1:
        return cVModel.waterSunrise4_1;
      case WaterCycleType.sunrise4_2:
        return cVModel.waterSunrise4_2;

      case WaterCycleType.sunrise5_1:
        return cVModel.waterDay3;
      case WaterCycleType.sunrise5_2:
        return cVModel.waterDay4;

      case WaterCycleType.day1_1:
        return cVModel.waterDay1;
      case WaterCycleType.day1_2:
        return cVModel.waterDay2;
      case WaterCycleType.day2_1:
        return cVModel.waterDay3;
      case WaterCycleType.day2_2:
        return cVModel.waterDay4;

      case WaterCycleType.sunset1_1:
        return cVModel.waterSunrise4_1;
      case WaterCycleType.sunset1_2:
        return cVModel.waterSunrise4_2;

      case WaterCycleType.sunset2_1:
        return cVModel.waterSunset1_1;
      case WaterCycleType.sunset2_2:
        return cVModel.waterSunset1_2;
      case WaterCycleType.sunset3_1:
        return cVModel.waterSunset2_1;
      case WaterCycleType.sunset3_2:
        return cVModel.waterSunset2_2;
      case WaterCycleType.sunset4_1:
        return cVModel.waterSunset3_1;
      case WaterCycleType.sunset4_2:
        return cVModel.waterSunset3_2;
      case WaterCycleType.sunset5_1:
        return cVModel.waterNight1;
      case WaterCycleType.sunset5_2:
        return cVModel.waterNight2;
      case WaterCycleType.night3_1:
        return cVModel.waterNight3;
      case WaterCycleType.night3_2:
        return cVModel.waterNight4;
    }
  }

  Sprite getTopSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case WaterCycleType.night1:
        return cVModel.waterNight4;
      case WaterCycleType.night2:
        return cVModel.waterNight1;
      case WaterCycleType.sunrise1_1:
        return cVModel.waterNight2;
      case WaterCycleType.sunrise1_2:
        return cVModel.waterSunrise1_1;
      case WaterCycleType.sunrise2_1:
        return cVModel.waterSunrise1_2;
      case WaterCycleType.sunrise2_2:
        return cVModel.waterSunrise2_1;
      case WaterCycleType.sunrise3_1:
        return cVModel.waterSunrise2_2;
      case WaterCycleType.sunrise3_2:
        return cVModel.waterSunrise3_1;
      case WaterCycleType.sunrise4_1:
        return cVModel.waterSunrise3_2;
      case WaterCycleType.sunrise4_2:
        return cVModel.waterSunrise4_1;

      case WaterCycleType.sunrise5_1:
        return cVModel.waterSunrise4_2;

      case WaterCycleType.sunrise5_2:
        return cVModel.waterDay3;

      case WaterCycleType.day1_1:
        return cVModel.waterDay4;
      case WaterCycleType.day1_2:
        return cVModel.waterDay1;
      case WaterCycleType.day2_1:
        return cVModel.waterDay2;
      case WaterCycleType.day2_2:
        return cVModel.waterDay3;

      case WaterCycleType.sunset1_1:
        return cVModel.waterDay4;
      case WaterCycleType.sunset1_2:
        return cVModel.waterSunrise4_1;

      case WaterCycleType.sunset2_1:
        return cVModel.waterSunrise4_2;
      case WaterCycleType.sunset2_2:
        return cVModel.waterSunset1_1;
      case WaterCycleType.sunset3_1:
        return cVModel.waterSunset1_2;
      case WaterCycleType.sunset3_2:
        return cVModel.waterSunset2_1;
      case WaterCycleType.sunset4_1:
        return cVModel.waterSunset2_2;
      case WaterCycleType.sunset4_2:
        return cVModel.waterSunset3_1;
      case WaterCycleType.sunset5_1:
        return cVModel.waterSunset3_2;
      case WaterCycleType.sunset5_2:
        return cVModel.waterNight1;
      case WaterCycleType.night3_1:
        return cVModel.waterNight2;
      case WaterCycleType.night3_2:
        return cVModel.waterNight3;
    }
  }
}
