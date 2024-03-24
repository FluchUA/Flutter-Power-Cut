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

      /// Interface
      ..interfaceCO2 =
          await getSpriteFromAsset('assets/interface/interface_co2.png')
      ..interfaceCalendar =
          await getSpriteFromAsset('assets/interface/interface_calendar.png')
      ..interfaceSmile =
          await getSpriteFromAsset('assets/interface/interface_smile.png')

      /// Control panel
      ..controlPanel =
          await getSpriteFromAsset('assets/control_panel/control_panel.png')
      ..controlPanelButtonOn =
          await getSpriteFromAsset('assets/control_panel/button_down.png')
      ..controlPanelButtonOff =
          await getSpriteFromAsset('assets/control_panel/button_up.png')

      /// City
      ..cityDay = await getSpriteFromAsset('assets/city/city_day.png')
      ..cityNight = await getSpriteFromAsset('assets/city/city_night.png')
      ..citySunRise1 = await getSpriteFromAsset('assets/city/city_sunrise1.png')
      ..citySunRise2 = await getSpriteFromAsset('assets/city/city_sunrise2.png')
      ..empty = await getSpriteFromAsset('assets/empty.png')

      /// Windows
      /// big
      ..bb1_1 = await getSpriteFromAsset('assets/city/windows/bb1_1.png')
      ..bb1_2 = await getSpriteFromAsset('assets/city/windows/bb1_2.png')
      ..bb1_3 = await getSpriteFromAsset('assets/city/windows/bb1_3.png')
      ..bb1_4 = await getSpriteFromAsset('assets/city/windows/bb1_4.png')
      ..bb2_1 = await getSpriteFromAsset('assets/city/windows/bb2_1.png')
      ..bb2_2 = await getSpriteFromAsset('assets/city/windows/bb2_2.png')
      ..bb2_3 = await getSpriteFromAsset('assets/city/windows/bb2_3.png')
      ..bb2_4 = await getSpriteFromAsset('assets/city/windows/bb2_4.png')
      ..bb3_1 = await getSpriteFromAsset('assets/city/windows/bb3_1.png')
      ..bb3_2 = await getSpriteFromAsset('assets/city/windows/bb3_2.png')
      ..bb3_3 = await getSpriteFromAsset('assets/city/windows/bb3_3.png')
      ..bb3_4 = await getSpriteFromAsset('assets/city/windows/bb3_4.png')
      ..bb4_1 = await getSpriteFromAsset('assets/city/windows/bb4_1.png')
      ..bb4_2 = await getSpriteFromAsset('assets/city/windows/bb4_2.png')
      ..bb4_3 = await getSpriteFromAsset('assets/city/windows/bb4_3.png')
      ..bb4_4 = await getSpriteFromAsset('assets/city/windows/bb4_4.png')
      ..bb4_5 = await getSpriteFromAsset('assets/city/windows/bb4_5.png')
      ..bb5_1 = await getSpriteFromAsset('assets/city/windows/bb5_1.png')
      ..bb5_2 = await getSpriteFromAsset('assets/city/windows/bb5_2.png')
      ..bb5_3 = await getSpriteFromAsset('assets/city/windows/bb5_3.png')
      ..bb5_4 = await getSpriteFromAsset('assets/city/windows/bb5_4.png')
      ..bb6_1 = await getSpriteFromAsset('assets/city/windows/bb6_1.png')
      ..bb6_2 = await getSpriteFromAsset('assets/city/windows/bb6_2.png')
      ..bb6_3 = await getSpriteFromAsset('assets/city/windows/bb6_3.png')
      ..bb6_4 = await getSpriteFromAsset('assets/city/windows/bb6_4.png')

      /// middle
      ..mb1_1 = await getSpriteFromAsset('assets/city/windows/mb1_1.png')
      ..mb1_2 = await getSpriteFromAsset('assets/city/windows/mb1_2.png')
      ..mb1_3 = await getSpriteFromAsset('assets/city/windows/mb1_3.png')
      ..mb2_1 = await getSpriteFromAsset('assets/city/windows/mb2_1.png')
      ..mb2_2 = await getSpriteFromAsset('assets/city/windows/mb2_2.png')
      ..mb2_3 = await getSpriteFromAsset('assets/city/windows/mb2_3.png')
      ..mb3_1 = await getSpriteFromAsset('assets/city/windows/mb3_1.png')
      ..mb3_2 = await getSpriteFromAsset('assets/city/windows/mb3_2.png')
      ..mb3_3 = await getSpriteFromAsset('assets/city/windows/mb3_3.png')
      ..mb4_1 = await getSpriteFromAsset('assets/city/windows/mb4_1.png')
      ..mb4_2 = await getSpriteFromAsset('assets/city/windows/mb4_2.png')
      ..mb4_3 = await getSpriteFromAsset('assets/city/windows/mb4_3.png')
      ..mb5_1 = await getSpriteFromAsset('assets/city/windows/mb5_1.png')
      ..mb5_2 = await getSpriteFromAsset('assets/city/windows/mb5_2.png')
      ..mb5_3 = await getSpriteFromAsset('assets/city/windows/mb5_3.png')
      ..mb6_1 = await getSpriteFromAsset('assets/city/windows/mb6_1.png')
      ..mb6_2 = await getSpriteFromAsset('assets/city/windows/mb6_2.png')
      ..mb6_3 = await getSpriteFromAsset('assets/city/windows/mb6_3.png')

      /// small
      ..sb1_1 = await getSpriteFromAsset('assets/city/windows/sb1_1.png')
      ..sb1_2 = await getSpriteFromAsset('assets/city/windows/sb1_2.png')
      ..sb1_3 = await getSpriteFromAsset('assets/city/windows/sb1_3.png')
      ..sb2_1 = await getSpriteFromAsset('assets/city/windows/sb2_1.png')
      ..sb2_2 = await getSpriteFromAsset('assets/city/windows/sb2_2.png')
      ..sb2_3 = await getSpriteFromAsset('assets/city/windows/sb2_3.png')
      ..sb3_1 = await getSpriteFromAsset('assets/city/windows/sb3_1.png')
      ..sb3_2 = await getSpriteFromAsset('assets/city/windows/sb3_2.png')
      ..sb3_3 = await getSpriteFromAsset('assets/city/windows/sb3_3.png')
      ..sb4_1 = await getSpriteFromAsset('assets/city/windows/sb4_1.png')
      ..sb4_2 = await getSpriteFromAsset('assets/city/windows/sb4_2.png')
      ..sb4_3 = await getSpriteFromAsset('assets/city/windows/sb4_3.png')
      ..sb5_1 = await getSpriteFromAsset('assets/city/windows/sb5_1.png')
      ..sb5_2 = await getSpriteFromAsset('assets/city/windows/sb5_2.png')
      ..sb5_3 = await getSpriteFromAsset('assets/city/windows/sb5_3.png')
      ..sb6_1 = await getSpriteFromAsset('assets/city/windows/sb6_1.png')
      ..sb6_2 = await getSpriteFromAsset('assets/city/windows/sb6_2.png')
      ..sb6_3 = await getSpriteFromAsset('assets/city/windows/sb6_3.png')
      ..sb7_1 = await getSpriteFromAsset('assets/city/windows/sb7_1.png')
      ..sb7_2 = await getSpriteFromAsset('assets/city/windows/sb7_2.png')
      ..sb7_3 = await getSpriteFromAsset('assets/city/windows/sb7_3.png')
      ..sb8_1 = await getSpriteFromAsset('assets/city/windows/sb8_1.png')
      ..sb8_2 = await getSpriteFromAsset('assets/city/windows/sb8_2.png')
      ..sb8_3 = await getSpriteFromAsset('assets/city/windows/sb8_3.png')
      ..sb9_1 = await getSpriteFromAsset('assets/city/windows/sb9_1.png')
      ..sb9_2 = await getSpriteFromAsset('assets/city/windows/sb9_2.png')
      ..sb9_3 = await getSpriteFromAsset('assets/city/windows/sb9_3.png')
      ..factory = await getSpriteFromAsset('assets/city/windows/factory.png')

      /// Particles
      ..ash = await getSpriteFromAsset('assets/particles/ash.png')
      ..menuSmoke1 = await getSpriteFromAsset(
          'assets/particles/smoke_menu/menu_smoke1.png')
      ..menuSmoke2 = await getSpriteFromAsset(
          'assets/particles/smoke_menu/menu_smoke2.png')
      ..menuSmoke3 = await getSpriteFromAsset(
          'assets/particles/smoke_menu/menu_smoke3.png')

      /// Notifiers
      ..co2Notifier = ValueNotifier(0)
      ..calendarNotifier = ValueNotifier(1)
      ..dislikesNotifier = ValueNotifier(0);

    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const GamePageMenu()),
    );
  }
}
