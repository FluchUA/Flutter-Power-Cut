import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/models/common_values_model.dart';
import 'package:global_gamers_challenge/power_cut_game/models/power_cut_game_controller.dart';
import 'package:global_gamers_challenge/power_cut_game/widgets/city_widget.dart';

class PowerCutGamePage extends StatefulWidget {
  const PowerCutGamePage({super.key});

  @override
  State<PowerCutGamePage> createState() => _PowerCutGamePageState();
}

class _PowerCutGamePageState extends State<PowerCutGamePage>
    with WidgetsBindingObserver {
  final ScrollController _skyScrollController = ScrollController();
  final ScrollController _waterScrollController = ScrollController();
  final ScrollController _controlPanelScrollController = ScrollController();

  final CommonValuesModel _cVModel = CommonValuesModel.instance;
  final PowerCutGameController _gameCtrl = PowerCutGameController.instance;

  final List<Widget> _skyList = [];
  final List<Widget> _waterList = [];
  final List<Widget> _ctrlPanelList = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _gameCtrl
          ..manageAddingSkyItem(3, _skyList)
          ..manageAddingWaterItem(3, _waterList)
          ..manageAddingCtrlItem(1, _ctrlPanelList);
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _manageScale(isFirstLaunch: true);
        _updateScroll();
      });
    });
    // WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _skyScrollController.dispose();
    _waterScrollController.dispose();
    _controlPanelScrollController.dispose();
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // @override
  // void didChangeMetrics() {
  //   super.didChangeMetrics();
  //   _manageScale();
  //   _updateScroll();
  // }

  @override
  Widget build(BuildContext context) {
    _manageScale();
    _updateScroll();

    final currentHeight = _cVModel.screenH > _cVModel.minScreenHeight
        ? _cVModel.screenH
        : _cVModel.minScreenHeight;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            /// Sky
            Positioned(
              top: 0,
              child: SizedBox(
                width: _cVModel.screenW,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: _skyScrollController,
                  child: Row(
                    key: UniqueKey(),
                    children: _skyList,
                  ),
                ),
              ),
            ),

            /// Water
            Positioned(
              top: currentHeight -
                  _cVModel.waterHeight * _cVModel.scale -
                  _cVModel.screenOffset * _cVModel.scale,
              child: SizedBox(
                width: _cVModel.screenW,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: _waterScrollController,
                  child: Row(
                    key: UniqueKey(),
                    children: _waterList,
                  ),
                ),
              ),
            ),

            /// City
            Positioned(
              left: 0,
              right: 0,
              top: currentHeight -
                  _cVModel.cityHeight * _cVModel.scale -
                  _cVModel.screenOffset * _cVModel.scale -
                  _cVModel.additionalCityScreenOffset * _cVModel.scale,
              child: Center(
                key: UniqueKey(),
                child: const CityWidget(),
              ),
            ),

            /// Control panel
            Positioned(
              top: currentHeight - _cVModel.ctrlPanelHeight * _cVModel.scale,
              child: SizedBox(
                width: _cVModel.screenW,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: _controlPanelScrollController,
                  child: Row(
                    key: UniqueKey(),
                    children: _ctrlPanelList,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _manageScale({bool isFirstLaunch = false}) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;

    _cVModel
      ..screenW = screenW
      ..screenH = screenH;

    /// Determining the minimum size of one side of the screen
    final minLength = screenW > screenH ? screenH : screenW;

    ///  If the size of one side of the screen has changed
    if (screenW >= _cVModel.minScreenWidth &&
        screenH >= _cVModel.minScreenHeight) {
      _cVModel.scale = minLength / _cVModel.minScreenWidth;

      _gameCtrl.manageBackgroundList(
        skyList: _skyList,
        waterList: _waterList,
        ctrlPanelList: _ctrlPanelList,
        skyScrollCtrl: _skyScrollController,
        waterScrollCtrl: _waterScrollController,
        controlPanelScroll: _controlPanelScrollController,
      );
    }
  }

  void _updateScroll() {
    setState(() {
      _gameCtrl.updateScroll(
        skyScrollCtrl: _skyScrollController,
        waterScrollCtrl: _waterScrollController,
        controlPanelScroll: _controlPanelScrollController,
      );
    });
  }
}
