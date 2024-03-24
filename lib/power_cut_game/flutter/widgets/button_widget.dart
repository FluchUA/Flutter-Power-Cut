import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: _onTapDown,
      onTapUp: _onTapUp,
      onPanEnd: _resetButton,
      child: Image.asset(_isPressed
          ? 'assets/button/button_pressed.png'
          : 'assets/button/button_default.png'),
    );
  }

  void _onTapDown(DragDownDetails _) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails _) {
    setState(() {
      _isPressed = false;
    });
  }

  void _resetButton(DragEndDetails _) {
    setState(() {
      _isPressed = false;
    });
  }
}
