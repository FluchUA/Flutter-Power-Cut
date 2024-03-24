import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/city_bottom_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/city_top_component.dart';
import 'package:global_gamers_challenge/power_cut_game/flame/flame_models/components/city/smoke/city_smoke_component.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class CityMainComponent extends PositionComponent {
  final CommonValuesModel _cVModel = CommonValuesModel.instance;
  final List<Sprite> _smokeSprites = [];
  final List<CitySmokeComponent> leftSmokeList = [];
  final List<CitySmokeComponent> rightSmokeList = [];
  final List<CitySmokeComponent> centerSmokeList = [];
  double _cityPosY = 0;

  double initLeftSmokePosY = 0;
  double initCenterSmokePosY = 0;
  double initRightSmokePosY = 0;

  @override
  FutureOr<void> onLoad() async {
    add(CityBottomComponent());
    add(CityTopComponent());

    _smokeSprites.addAll(
        [_cVModel.menuSmoke1, _cVModel.menuSmoke2, _cVModel.menuSmoke3]);
    for (var i = 0; i < _cVModel.citySmokeNumber; i++) {
      leftSmokeList.add(CitySmokeComponent());
      rightSmokeList.add(CitySmokeComponent());
      centerSmokeList.add(CitySmokeComponent());
    }
    await addAll(leftSmokeList);
    await addAll(rightSmokeList);
    await addAll(centerSmokeList);
    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    _cityPosY = _cVModel.currentEdgeHeight -
        _cVModel.cityOffset * _cVModel.scale -
        _cVModel.additionalCityScreenOffset * _cVModel.scale;

    for (var i = 0; i < centerSmokeList.length; i++) {
      leftSmokeList[i]
        ..position.y = _cityPosY -
            _cVModel.cityHeight * 0.5 * _cVModel.scale -
            (i * 8 * _cVModel.scale)
        ..position.x =
            size.x * 0.5 - (_cVModel.cityWidth * 0.37 * _cVModel.scale);
      rightSmokeList[i]
        ..position.y = _cityPosY -
            _cVModel.cityHeight * 0.52 * _cVModel.scale -
            (i * 8 * _cVModel.scale)
        ..position.x =
            size.x * 0.5 - (_cVModel.cityWidth * 0.315 * _cVModel.scale);
      centerSmokeList[i]
        ..position.y = _cityPosY -
            _cVModel.cityHeight * 0.47 * _cVModel.scale -
            (i * 8 * _cVModel.scale)
        ..position.x =
            size.x * 0.5 - (_cVModel.cityWidth * 0.34 * _cVModel.scale);
    }

    initLeftSmokePosY = _cityPosY - _cVModel.cityHeight * 0.5 * _cVModel.scale;
    initCenterSmokePosY =
        _cityPosY - _cVModel.cityHeight * 0.47 * _cVModel.scale;
    initRightSmokePosY =
        _cityPosY - _cVModel.cityHeight * 0.52 * _cVModel.scale;
  }

  @override
  void update(double dt) {
    super.update(dt);

    final smokeSpeed = _cVModel.stepSpeed * 0.05;
    for (var i = 0; i < centerSmokeList.length; i++) {
      leftSmokeList[i].position.y -= smokeSpeed;
      rightSmokeList[i].position.y -= smokeSpeed;
      centerSmokeList[i].position.y -= smokeSpeed;

      final topFactor = _cVModel.cityHeight * 0.5 * _cVModel.scale;
      final topLeft = initLeftSmokePosY - topFactor;
      final toRight = initRightSmokePosY - topFactor;
      final toCenter = initCenterSmokePosY - topFactor;

      if (leftSmokeList[i].position.y < topLeft) {
        leftSmokeList[i].position.y = initLeftSmokePosY;
        leftSmokeList[i].sprite = _smokeSprites.random();
      }
      if (rightSmokeList[i].position.y < toRight) {
        rightSmokeList[i].position.y = initRightSmokePosY;
        rightSmokeList[i].sprite = _smokeSprites.random();
      }
      if (centerSmokeList[i].position.y < toCenter) {
        centerSmokeList[i].position.y = initCenterSmokePosY;
        centerSmokeList[i].sprite = _smokeSprites.random();
      }

      final topCenterAlphaFactor =
          initCenterSmokePosY - _cVModel.cityHeight * 0.35 * _cVModel.scale;
      final topLeftAlphaFactor =
          initLeftSmokePosY - _cVModel.cityHeight * 0.4 * _cVModel.scale;
      final topRightAlphaFactor =
          initRightSmokePosY - _cVModel.cityHeight * 0.45 * _cVModel.scale;
      final topMinAlphaFactor = initLeftSmokePosY * 0.5 * _cVModel.scale;

      /// Alpha
      var currentLeftAlpha = (255 / topMinAlphaFactor) *
          (leftSmokeList[i].position.y - topLeftAlphaFactor);
      if (currentLeftAlpha > 255) currentLeftAlpha = 255;
      if (currentLeftAlpha < 0) currentLeftAlpha = 0;

      var currentRightAlpha = (255 / topMinAlphaFactor) *
          (rightSmokeList[i].position.y - topRightAlphaFactor);
      if (currentRightAlpha > 255) currentRightAlpha = 255;
      if (currentRightAlpha < 0) currentRightAlpha = 0;

      var currentCenterAlpha = (255 / topMinAlphaFactor) *
          (centerSmokeList[i].position.y - topCenterAlphaFactor);
      if (currentCenterAlpha > 255) currentCenterAlpha = 255;
      if (currentCenterAlpha < 0) currentCenterAlpha = 0;

      leftSmokeList[i].setAlpha(currentLeftAlpha.toInt());
      rightSmokeList[i].setAlpha(currentRightAlpha.toInt());
      centerSmokeList[i].setAlpha(currentCenterAlpha.toInt());

      /// Size
      final currentLeftSize = (((-_cVModel.smokeSize / initLeftSmokePosY) *
                      leftSmokeList[i].position.y +
                  11) +
              _cVModel.smokeSize) *
          0.5;
      leftSmokeList[i].size = Vector2(
          currentLeftSize * _cVModel.scale, currentLeftSize * _cVModel.scale);

      final currentRightSize = (((-_cVModel.smokeSize / initRightSmokePosY) *
                      rightSmokeList[i].position.y +
                  11) +
              _cVModel.smokeSize) *
          0.5;
      rightSmokeList[i].size = Vector2(
          currentRightSize * _cVModel.scale, currentRightSize * _cVModel.scale);

      final currentCenterSize = (((-_cVModel.smokeSize / initCenterSmokePosY) *
                      centerSmokeList[i].position.y +
                  11) +
              _cVModel.smokeSize) *
          0.5;
      centerSmokeList[i].size = Vector2(currentCenterSize * _cVModel.scale,
          currentCenterSize * _cVModel.scale);
    }
  }
}
