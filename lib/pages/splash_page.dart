import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/pages/game_page_menu.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';
import 'package:global_gamers_challenge/utils/sprite_utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;

  @override
  void initState() {
    _loadResources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        ),
      ),
    );
  }

  Future<void> _loadResources() async {
    await Future.delayed(const Duration(seconds: 3));

    _cVModel

      /// Sky
      ..skyDay = await getSpriteFromAsset('assets/sky/sky_day.png')
      ..skyNight1 = await getSpriteFromAsset('assets/sky/sky_night1.png')
      ..skyNight2 = await getSpriteFromAsset('assets/sky/sky_night2.png')
      ..skyNight3 = await getSpriteFromAsset('assets/sky/sky_night3.png')
      ..skyNight4 = await getSpriteFromAsset('assets/sky/sky_night4.png')
      ..skySunRise1_1 =
          await getSpriteFromAsset('assets/sky/sky_sun_rise1_1.png')
      ..skySunRise1_2 =
          await getSpriteFromAsset('assets/sky/sky_sun_rise1_2.png')
      ..skySunRise2_1 =
          await getSpriteFromAsset('assets/sky/sky_sun_rise2_1.png')
      ..skySunRise2_2 =
          await getSpriteFromAsset('assets/sky/sky_sun_rise2_2.png')
      ..skySunRise3_1 =
          await getSpriteFromAsset('assets/sky/sky_sun_rise3_1.png')
      ..skySunRise3_2 =
          await getSpriteFromAsset('assets/sky/sky_sun_rise3_2.png')
      ..skySunRise4 = await getSpriteFromAsset('assets/sky/sky_sun_rise4.png')

      /// Water
      ..waterDay1 = await getSpriteFromAsset('assets/water/day1.png')
      ..waterDay2 = await getSpriteFromAsset('assets/water/day2.png')
      ..waterDay3 = await getSpriteFromAsset('assets/water/day3.png')
      ..waterDay4 = await getSpriteFromAsset('assets/water/day4.png')
      ..waterNight1 = await getSpriteFromAsset('assets/water/night1.png')
      ..waterNight2 = await getSpriteFromAsset('assets/water/night2.png')
      ..waterNight3 = await getSpriteFromAsset('assets/water/night3.png')
      ..waterNight4 = await getSpriteFromAsset('assets/water/night4.png')
      ..waterSunrise1_1 =
          await getSpriteFromAsset('assets/water/sunrise1_1.png')
      ..waterSunrise1_2 =
          await getSpriteFromAsset('assets/water/sunrise1_2.png')
      ..waterSunrise2_1 =
          await getSpriteFromAsset('assets/water/sunrise2_1.png')
      ..waterSunrise2_2 =
          await getSpriteFromAsset('assets/water/sunrise2_2.png')
      ..waterSunrise3_1 =
          await getSpriteFromAsset('assets/water/sunrise3_1.png')
      ..waterSunrise3_2 =
          await getSpriteFromAsset('assets/water/sunrise3_2.png')
      ..waterSunrise4_1 =
          await getSpriteFromAsset('assets/water/sunrise4_1.png')
      ..waterSunrise4_2 =
          await getSpriteFromAsset('assets/water/sunrise4_2.png')
      ..waterSunset1_1 = await getSpriteFromAsset('assets/water/sunset1_1.png')
      ..waterSunset1_2 = await getSpriteFromAsset('assets/water/sunset1_2.png')
      ..waterSunset2_1 = await getSpriteFromAsset('assets/water/sunset2_1.png')
      ..waterSunset2_2 = await getSpriteFromAsset('assets/water/sunset2_2.png')
      ..waterSunset3_1 = await getSpriteFromAsset('assets/water/sunset3_1.png')
      ..waterSunset3_2 = await getSpriteFromAsset('assets/water/sunset3_2.png')

      /// Menu
      ..mainMenuBackground =
          await getSpriteFromAsset('assets/menu/menu_background.png')
      ..mainMenu = await getSpriteFromAsset('assets/menu/menu_main.png')

      /// Notifier
      ..scaleNotifier = ValueNotifier(1);

    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const GamePageMenu()),
    );
  }
}
