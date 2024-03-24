import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/power_cut_game_menu.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/overlays/main_menu_overlay.dart';

class TutorialOverlay extends StatefulWidget {
  const TutorialOverlay(this.powerCutMenu, {super.key});

  static String overlayName = 'TutorialOverlay';
  final PowerCutGameMenu powerCutMenu;

  @override
  State<TutorialOverlay> createState() => _TutorialOverlayState();
}

class _TutorialOverlayState extends State<TutorialOverlay> {
  static const Color _buttonColor = Color(0xFF680000);
  static const Color _textColor = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: 800,
          height: 650,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/tutorial.png',
                width: 700,
              ),
              const SizedBox(height: 40),

              /// Ok btn
              SizedBox(
                width: 150,
                height: 40,
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
                    'Ok',
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

  void _onOkPressed() {
    widget.powerCutMenu.overlays.remove(TutorialOverlay.overlayName);
    widget.powerCutMenu.overlays.add(MainMenuOverlay.overlayName);
  }
}
