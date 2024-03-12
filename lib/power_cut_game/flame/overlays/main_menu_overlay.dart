import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/pages/game_page.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class MainMenuOverlay extends StatefulWidget {
  const MainMenuOverlay({super.key});

  static String overlayName = 'MainMenuOverlay';

  @override
  State<MainMenuOverlay> createState() => _MainMenuOverlayState();
}

class _MainMenuOverlayState extends State<MainMenuOverlay> {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;
  static const Color _buttonColor = Color(0xFF680000);
  static const Color _textColor = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ValueListenableBuilder(
            valueListenable: _cVModel.scaleNotifier,
            builder: (context, value, _) {
              return Transform.scale(
                scale: value,
                child: Container(
                  width: 120,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Play btn
                      SizedBox(
                        width: 100,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: _onPlayPressed,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(_buttonColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Play',
                            style: TextStyle(color: _textColor),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// Tutorial btn
                      SizedBox(
                        width: 100,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: _onTutorialPressed,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(_buttonColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Tutorial',
                            style: TextStyle(color: _textColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Future<void> _onPlayPressed() async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const GamePage()),
    );
  }

  void _onTutorialPressed() {}
}
