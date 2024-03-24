import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

enum DayCycleType {
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
  sunrise5(50, 60),
  day(60, 80),
  sunset1(80, 90),
  sunset2_1(90, 95),
  sunset2_2(95, 100),
  sunset3_1(100, 105),
  sunset3_2(105, 110),
  sunset4_1(110, 115),
  sunset4_2(115, 120),
  sunset5_1(120, 125),
  sunset5_2(125, 130),
  night3(130, 135),
  night4(135, 140);

  const DayCycleType(this.timeStart, this.timeEnd);

  final double timeStart;
  final double timeEnd;

  Sprite getBottomSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case DayCycleType.night1:
        return cVModel.skyNight1;
      case DayCycleType.night2:
        return cVModel.skyNight2;
      case DayCycleType.sunrise1_1:
        return cVModel.skySunRise1_1;
      case DayCycleType.sunrise1_2:
        return cVModel.skySunRise1_2;
      case DayCycleType.sunrise2_1:
        return cVModel.skySunRise2_1;
      case DayCycleType.sunrise2_2:
        return cVModel.skySunRise2_2;
      case DayCycleType.sunrise3_1:
        return cVModel.skySunRise3_1;
      case DayCycleType.sunrise3_2:
        return cVModel.skySunRise3_2;
      case DayCycleType.sunrise4_1:
        return cVModel.skySunRise4;
      case DayCycleType.sunrise4_2:
        return cVModel.skySunRise4;
      case DayCycleType.sunrise5:
        return cVModel.skyDay;
      case DayCycleType.day:
        return cVModel.skyDay;
      case DayCycleType.sunset1:
        return cVModel.skySunRise4;
      case DayCycleType.sunset2_1:
        return cVModel.skySunRise3_2;
      case DayCycleType.sunset2_2:
        return cVModel.skySunRise3_1;
      case DayCycleType.sunset3_1:
        return cVModel.skySunRise2_2;
      case DayCycleType.sunset3_2:
        return cVModel.skySunRise2_1;
      case DayCycleType.sunset4_1:
        return cVModel.skySunRise1_2;
      case DayCycleType.sunset4_2:
        return cVModel.skySunRise1_1;
      case DayCycleType.sunset5_1:
        return cVModel.skyNight1;
      case DayCycleType.sunset5_2:
        return cVModel.skyNight2;
      case DayCycleType.night3:
        return cVModel.skyNight3;
      case DayCycleType.night4:
        return cVModel.skyNight4;
    }
  }

  Sprite getTopSprite() {
    final cVModel = CommonValuesModel.instance;

    switch (this) {
      case DayCycleType.night1:
        return cVModel.skyNight4;
      case DayCycleType.night2:
        return cVModel.skyNight1;
      case DayCycleType.sunrise1_1:
        return cVModel.skyNight2;
      case DayCycleType.sunrise1_2:
        return cVModel.skySunRise1_1;
      case DayCycleType.sunrise2_1:
        return cVModel.skySunRise1_2;
      case DayCycleType.sunrise2_2:
        return cVModel.skySunRise2_1;
      case DayCycleType.sunrise3_1:
        return cVModel.skySunRise2_2;
      case DayCycleType.sunrise3_2:
        return cVModel.skySunRise3_1;
      case DayCycleType.sunrise4_1:
        return cVModel.skySunRise3_2;
      case DayCycleType.sunrise4_2:
        return cVModel.skySunRise4;
      case DayCycleType.sunrise5:
        return cVModel.skySunRise4;
      case DayCycleType.day:
        return cVModel.skyDay;
      case DayCycleType.sunset1:
        return cVModel.skyDay;
      case DayCycleType.sunset2_1:
        return cVModel.skySunRise4;
      case DayCycleType.sunset2_2:
        return cVModel.skySunRise3_2;
      case DayCycleType.sunset3_1:
        return cVModel.skySunRise3_1;
      case DayCycleType.sunset3_2:
        return cVModel.skySunRise2_2;
      case DayCycleType.sunset4_1:
        return cVModel.skySunRise2_1;
      case DayCycleType.sunset4_2:
        return cVModel.skySunRise1_2;
      case DayCycleType.sunset5_1:
        return cVModel.skySunRise1_1;
      case DayCycleType.sunset5_2:
        return cVModel.skyNight1;
      case DayCycleType.night3:
        return cVModel.skyNight2;
      case DayCycleType.night4:
        return cVModel.skyNight3;
    }
  }
}
