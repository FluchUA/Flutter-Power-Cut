import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/main_menu/main_menu_back_main_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/main_menu/main_menu_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/main_menu/smoke/menu_smoke_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/particles/ahs_component.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';
import 'package:global_gamers_challenge/utils/screen_resize.dart';

class MainMenuComponent extends PositionComponent {
  final ScreenResizeModel _screenResizeModel = ScreenResizeModel.instance;
  final CommonValuesModel _cVModel = CommonValuesModel.instance;
  final List<Sprite> _smokeSprites = [];
  final List<MenuSmokeComponent> leftSmokeList = [];
  final List<MenuSmokeComponent> rightSmokeList = [];
  final List<MenuSmokeComponent> centerSmokeList = [];

  double initSideSmokePosY = 0;
  double initCenterSmokePosY = 0;

  @override
  FutureOr<void> onLoad() async {
    await Future.delayed(const Duration(milliseconds: 100));

    add(MainMenuBackMainComponent());
    add(MainMenuCenterComponent());

    _smokeSprites.addAll(
        [_cVModel.menuSmoke1, _cVModel.menuSmoke2, _cVModel.menuSmoke3]);
    for (var i = 0; i < _cVModel.smokeNumber; i++) {
      leftSmokeList.add(MenuSmokeComponent()..sprite = _smokeSprites.random());
      rightSmokeList.add(MenuSmokeComponent()..sprite = _smokeSprites.random());
      centerSmokeList
          .add(MenuSmokeComponent()..sprite = _smokeSprites.random());
    }
    await addAll(leftSmokeList);
    await addAll(rightSmokeList);
    await addAll(centerSmokeList);

    for (var i = 0; i < _cVModel.ashNumber; i++) {
      add(AshComponent());
    }

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    final menuScale = _cVModel.currentEdgeHeight / _cVModel.minScreenWidth;
    for (var i = 0; i < centerSmokeList.length; i++) {
      final posY = (_cVModel.mainMenuHeight * 0.3) * menuScale -
          _cVModel.mainMenuHeight * (i * 0.1) * menuScale;
      final posCenterY = (_cVModel.mainMenuHeight * 0.26) * menuScale -
          _cVModel.mainMenuHeight * (i * 0.1) * menuScale;

      leftSmokeList[i]
        ..position.y = posY
        ..position.x = size.x * 0.5 - menuScale * 95;
      rightSmokeList[i]
        ..position.y = posY
        ..position.x = size.x * 0.5 + menuScale * 95;
      centerSmokeList[i]
        ..position.y = posCenterY
        ..position.x = size.x * 0.5;
    }

    initSideSmokePosY = (_cVModel.mainMenuHeight * 0.3) * menuScale;
    initCenterSmokePosY = (_cVModel.mainMenuHeight * 0.26) * menuScale;

    if (_screenResizeModel.onScreenResize(size)) {
      onGameResize(Vector2(_cVModel.screenW, _cVModel.screenH));
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    final menuScale = _cVModel.currentEdgeHeight / _cVModel.minScreenWidth;
    for (var i = 0; i < centerSmokeList.length; i++) {
      leftSmokeList[i].position.y -= 0.25 * menuScale;
      rightSmokeList[i].position.y -= 0.25 * menuScale;
      centerSmokeList[i].position.y -= 0.25 * menuScale;

      final topEdge = (_cVModel.mainMenuHeight * 0.3) * menuScale;
      final topCenterEdge = (_cVModel.mainMenuHeight * 0.35) * menuScale;
      if (leftSmokeList[i].position.y < -topEdge) {
        leftSmokeList[i].position.y = initSideSmokePosY;
        leftSmokeList[i].sprite = _smokeSprites.random();
      }
      if (rightSmokeList[i].position.y < -topEdge) {
        rightSmokeList[i].position.y = initSideSmokePosY;
        rightSmokeList[i].sprite = _smokeSprites.random();
      }
      if (centerSmokeList[i].position.y < -topCenterEdge) {
        centerSmokeList[i].position.y = initCenterSmokePosY;
        centerSmokeList[i].sprite = _smokeSprites.random();
      }

      /// Alpha
      var currentLeftAlpha =
          (((-255 / (menuScale * 200)) * leftSmokeList[i].position.y) + 255) *
              0.5;
      if (currentLeftAlpha > 255) currentLeftAlpha = 255;
      if (currentLeftAlpha < 0) currentLeftAlpha = 0;

      var currentRightAlpha =
          (((-255 / (menuScale * 200)) * rightSmokeList[i].position.y) + 255) *
              0.5;
      if (currentRightAlpha > 255) currentRightAlpha = 255;
      if (currentRightAlpha < 0) currentRightAlpha = 0;

      var currentCenterAlpha =
          (((-255 / (menuScale * 150)) * centerSmokeList[i].position.y) + 255) *
              0.5;
      if (currentCenterAlpha > 255) currentCenterAlpha = 255;
      if (currentCenterAlpha < 0) currentCenterAlpha = 0;

      leftSmokeList[i].setAlpha(currentLeftAlpha.toInt());
      rightSmokeList[i].setAlpha(currentRightAlpha.toInt());
      centerSmokeList[i].setAlpha(currentCenterAlpha.toInt());

      /// Size
      final currentLeftSize =
          (((-_cVModel.smokeSize / (_cVModel.screenH * 0.5)) *
                      leftSmokeList[i].position.y) +
                  _cVModel.smokeSize) *
              0.5;
      leftSmokeList[i].size =
          Vector2(currentLeftSize * menuScale, currentLeftSize * menuScale);

      final currentRightSize =
          (((-_cVModel.smokeSize / (_cVModel.screenH * 0.5)) *
                      rightSmokeList[i].position.y) +
                  _cVModel.smokeSize) *
              0.5;
      rightSmokeList[i].size =
          Vector2(currentRightSize * menuScale, currentRightSize * menuScale);

      final currentCenterSize =
          (((-_cVModel.smokeSize / (_cVModel.screenH * 0.45)) *
                      centerSmokeList[i].position.y) +
                  _cVModel.smokeSize) *
              0.45;
      centerSmokeList[i].size =
          Vector2(currentCenterSize * menuScale, currentCenterSize * menuScale);
    }
  }
}
