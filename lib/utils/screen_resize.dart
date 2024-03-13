import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';
import 'package:global_gamers_challenge/utils/enums/screen_resize.dart';

class ScreenResizeModel {
  ScreenResizeModel._();

  static final ScreenResizeModel instance = ScreenResizeModel._();
  double _sizeFactor = -1;
  bool _isDoubleCheck = false;

  bool onScreenResize(Vector2 size) {
    final cVModel = CommonValuesModel.instance;

    cVModel
      ..screenW = size.x
      ..screenH = size.y

      /// Calculating height boundaries for positioning layers
      ..currentEdgeHeight = cVModel.screenH > cVModel.minScreenHeight
          ? cVModel.screenH
          : cVModel.minScreenHeight;

    /// Determining the minimum size of one side of the screen
    final minLength = cVModel.screenW > cVModel.currentEdgeHeight
        ? cVModel.currentEdgeHeight
        : cVModel.screenW;

    ///  Calculate scale
    cVModel.scale = minLength / cVModel.minScreenWidth;

    /// Determining whether the screen is currently increasing or decreasing
    final screenFactor = size.x / size.y;
    if (screenFactor > _sizeFactor) {
      cVModel.screenResizeType = ScreenResize.increase;
    } else if (screenFactor < _sizeFactor) {
      cVModel.screenResizeType = ScreenResize.decrease;
    } else {
      if (!_isDoubleCheck) {
        // cVModel.screenResizeType = ScreenResize.none;
      } else {
        _isDoubleCheck = false;
      }
    }

    /// Removes gaps between elements
    cVModel
      ..screenW += cVModel.screenW % 2 == 0 ? 1 : 0
      ..screenH += cVModel.screenH % 2 == 0 ? 1 : 0;

    cVModel.scaleNotifier.value = cVModel.scale;

    /// Additional call to calculate dimensions
    /// Fixes incorrect behavior for the browser when the screen size changes suddenly
    if (_sizeFactor != screenFactor) {
      _isDoubleCheck = true;
      _sizeFactor = screenFactor;
      return true;
    }

    return false;
  }
}
