import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/power_cut_game_menu.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/overlays/tutorial_overlay.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/pages/game_page.dart';

class MainMenuOverlay extends StatefulWidget {
  const MainMenuOverlay(this.powerCutMenu, {super.key});

  static String overlayName = 'MainMenuOverlay';
  final PowerCutGameMenu powerCutMenu;

  @override
  State<MainMenuOverlay> createState() => _MainMenuOverlayState();
}

class _MainMenuOverlayState extends State<MainMenuOverlay> {
  static const Color _buttonColor = Color(0xFF680000);
  static const Color _textColor = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Play btn
              SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  onPressed: _onPlayPressed,
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
                    'Play',
                    style: TextStyle(color: _textColor),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Tutorial btn
              SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  onPressed: _onTutorialPressed,
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
                    'Tutorial',
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

  Future<void> _onPlayPressed() async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const GamePage()),
    );
  }

  void _onTutorialPressed() {
    widget.powerCutMenu.overlays.remove(MainMenuOverlay.overlayName);
    widget.powerCutMenu.overlays.add(TutorialOverlay.overlayName);
  }
}
