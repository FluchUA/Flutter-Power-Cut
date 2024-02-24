import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/flutter/widgets/control_panel_background_widget.dart';
import 'package:global_gamers_challenge/power_cut_game/flutter/widgets/control_panel_widget.dart';
import 'package:global_gamers_challenge/power_cut_game/flutter/widgets/sky_widget.dart';
import 'package:global_gamers_challenge/power_cut_game/flutter/widgets/water_widget.dart';
import 'package:global_gamers_challenge/utils/common_values_model.dart';

class PowerCutGameController {
  PowerCutGameController._();

  static final PowerCutGameController instance = PowerCutGameController._();

  void manageAddingSkyItem(int count, List<Widget> list) {
    for (var i = 0; i < count; i++) {
      list.add(const SkyWidget());
    }
  }

  void manageAddingWaterItem(int count, List<Widget> list) {
    for (var i = 0; i < count; i++) {
      list.add(const WaterWidget());
    }
  }

  void manageAddingCtrlItem(int count, List<Widget> list) {
    if (list.isEmpty) {
      list.add(const ControlPanelWidget());
    }

    for (var i = 0; i < count; i++) {
      list
        ..insert(0, const ControlPanelBackgroundWidget())
        ..add(const ControlPanelBackgroundWidget());
    }
  }

  void manageRemovingBackgroundItems(int count, List<Widget> list,
      {bool isEdges = false}) {
    final cVModel = CommonValuesModel.instance;

    if (list.length == cVModel.minCountBackgroundElements) {
      return;
    }

    if (isEdges) {
      list
        ..removeAt(0)
        ..removeLast();
    } else {
      list.removeRange(list.length - count, list.length);
    }
  }

  void updateScroll({
    required ScrollController skyScrollCtrl,
    required ScrollController waterScrollCtrl,
    required ScrollController controlPanelScroll,
    bool isAnimate = false,
  }) {
    if (skyScrollCtrl.hasClients) {
      if (isAnimate) {
        final maxScroll = skyScrollCtrl.position.maxScrollExtent;
        skyScrollCtrl.animateTo(
          maxScroll / 2,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        final maxScroll = skyScrollCtrl.position.maxScrollExtent;
        skyScrollCtrl.jumpTo(maxScroll / 2);
      }
    }

    if (waterScrollCtrl.hasClients) {
      if (isAnimate) {
        final maxScroll = waterScrollCtrl.position.maxScrollExtent;
        waterScrollCtrl.animateTo(
          maxScroll / 2,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        final maxScroll = waterScrollCtrl.position.maxScrollExtent;
        waterScrollCtrl.jumpTo(maxScroll / 2);
      }
    }

    if (controlPanelScroll.hasClients) {
      if (isAnimate) {
        final maxScroll = controlPanelScroll.position.maxScrollExtent;
        controlPanelScroll.animateTo(
          maxScroll / 2,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        final maxScroll = controlPanelScroll.position.maxScrollExtent;
        controlPanelScroll.jumpTo(maxScroll / 2);
      }
    }
  }

  /// Control the number of web background elements.
  /// Add when the screen is zoomed in, remove when the screen is zoomed out
  void manageBackgroundList({
    required List<Widget> skyList,
    required List<Widget> waterList,
    required List<Widget> ctrlPanelList,
    required ScrollController skyScrollCtrl,
    required ScrollController waterScrollCtrl,
    required ScrollController controlPanelScroll,
  }) {
    final cVModel = CommonValuesModel.instance;

    /// All lists must have the same size, that's why I only check one
    if (skyList.isNotEmpty) {
      final skyWidth =
          skyList.length * cVModel.backgroundPartsWidth * cVModel.scale;

      /// Add elements
      if (skyWidth - 50 < cVModel.screenW) {
        manageAddingSkyItem(2, skyList);
        manageAddingWaterItem(2, waterList);
        manageAddingCtrlItem(1, ctrlPanelList);
      } else

      /// Remove elements
      if (skyWidth - cVModel.screenW >=
          cVModel.backgroundPartsWidth * cVModel.scale * 2.5) {
        manageRemovingBackgroundItems(2, skyList);
        manageRemovingBackgroundItems(2, waterList);
        manageRemovingBackgroundItems(1, ctrlPanelList, isEdges: true);
      }
    }

    updateScroll(
      skyScrollCtrl: skyScrollCtrl,
      waterScrollCtrl: waterScrollCtrl,
      controlPanelScroll: controlPanelScroll,
    );
  }
}
