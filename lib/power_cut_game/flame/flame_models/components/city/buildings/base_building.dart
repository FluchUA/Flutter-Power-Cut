import 'package:flame/components.dart';

class BaseBuilding {
  late SpriteComponent spriteComponent;

  bool isTurnOn() {
    return false;
  }

  void turnOf() {}

  void randomLight() {}

  (int, int) getData() {
    return (0, 0);
  }
}
