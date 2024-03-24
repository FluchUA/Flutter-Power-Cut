import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/overlays/widgets/overlay_widget.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/pages/game_page_menu.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class GameInterfaceOverlay extends StatefulWidget {
  const GameInterfaceOverlay({super.key});

  static String overlayName = 'GameInterfaceOverlay';

  @override
  State<GameInterfaceOverlay> createState() => _GameInterfaceOverlayState();
}

class _GameInterfaceOverlayState extends State<GameInterfaceOverlay> {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 5),
            child: GestureDetector(
              onTap: _onBackPressed,
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InterfaceWidget(
                    _cVModel.co2Notifier, 'assets/interface/interface_co2.png'),
                const SizedBox(width: 10),
                InterfaceWidget(_cVModel.calendarNotifier,
                    'assets/interface/interface_calendar.png'),
                const SizedBox(width: 10),
                InterfaceWidget(_cVModel.dislikesNotifier,
                    'assets/interface/interface_smile.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onBackPressed() async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const GamePageMenu()),
    );
  }
}
