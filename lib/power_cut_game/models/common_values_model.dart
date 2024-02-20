class CommonValuesModel {
  CommonValuesModel._();

  static final CommonValuesModel instance = CommonValuesModel._();

  final int screenOffset = 100;
  final int additionalCityScreenOffset = 25;

  final double backgroundPartsWidth = 500;
  final double waterHeight = 200;
  final double gradientHeight = 500;
  final double ctrlPanelHeight = 100;

  final double cityWidth = 500;
  final double cityHeight = 250;

  final double minScreenWidth = 500;
  final double minScreenHeight = 250;

  final int minCountBackgroundElements = 3;

  double scale = 1;

  double screenW = 0;
  double screenH = 0;
}
