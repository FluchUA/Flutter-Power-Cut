import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/pages/game_page_menu.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class GameOverOverlay extends StatefulWidget {
  const GameOverOverlay({super.key});

  static String overlayName = 'GameOverOverlay';

  @override
  State<GameOverOverlay> createState() => _GameOverOverlayState();
}

class _GameOverOverlayState extends State<GameOverOverlay> {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;
  static const Color _buttonColor = Color(0xFF680000);
  static const Color _textColor = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: 350,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              const Text(
                'Game Over',
                style: TextStyle(color: Color(0xFFFF6A00), fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Fighting the effects rather than the cause is always a losing battle',
                  style: TextStyle(color: Color(0xFFFF6A00)),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Column(
                  children: [
                    /// CO 2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Icon
                        Image.asset(
                          'assets/interface/interface_co2.png',
                          width: 30,
                          height: 30,
                        ),

                        /// Value
                        Text(
                          _cVModel.co2Notifier.value.toString(),
                          style: const TextStyle(color: Color(0xFFFF6A00)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    ///Days
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Icon
                        Image.asset(
                          'assets/interface/interface_calendar.png',
                          width: 30,
                          height: 30,
                        ),

                        /// Value
                        Text(
                          _cVModel.calendarNotifier.value.toString(),
                          style: const TextStyle(color: Color(0xFFFF6A00)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    /// Dislikes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Icon
                        Image.asset(
                          'assets/interface/interface_smile.png',
                          width: 30,
                          height: 30,
                        ),

                        /// Value
                        Text(
                          _cVModel.dislikesNotifier.value.toString(),
                          style: const TextStyle(color: Color(0xFFFF6A00)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              /// Ok btn
              SizedBox(
                width: 100,
                height: 30,
                child: ElevatedButton(
                  onPressed: _onOkPressed,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(_buttonColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(color: _textColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onOkPressed() async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const GamePageMenu()),
    );
  }
}
