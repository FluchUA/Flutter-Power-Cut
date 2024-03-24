import 'package:flame/components.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';
import 'package:global_gamers_challenge/utils/enums/screen_resize.dart';

class ScreenResizeModel {
  ScreenResizeModel._();

  static final ScreenResizeModel instance = ScreenResizeModel._();
  bool _isDoubleCheck = false;

  bool onScreenResize(Vector2 size) {
    final cVModel = CommonValuesModel.instance;

    _isDoubleCheck = cVModel.screenW != size.x || cVModel.screenH != size.y;

    /// Determining whether the screen is currently increasing or decreasing
    if (_isDoubleCheck) {
      if (cVModel.screenW <= size.x || cVModel.screenH >= size.y) {
        cVModel.screenResizeType = ScreenResize.increase;
      } else {
        cVModel.screenResizeType = ScreenResize.decrease;
      }
    }

    cVModel
      ..screenW = size.x
      ..screenH = size.y

      /// Removes most gaps between elements
      ..screenW += cVModel.screenW % 2 == 0 ? 1 : 0
      ..screenH += cVModel.screenH % 2 == 0 ? 1 : 0

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

    /// Additional call to calculate dimensions
    /// Fixes incorrect behavior for the browser when the screen size changes suddenly
    return _isDoubleCheck;
  }
}
