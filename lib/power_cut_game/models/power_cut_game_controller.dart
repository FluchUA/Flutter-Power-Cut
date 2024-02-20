import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/models/common_values_model.dart';
import 'package:global_gamers_challenge/power_cut_game/widgets/control_panel_background_widget.dart';
import 'package:global_gamers_challenge/power_cut_game/widgets/control_panel_widget.dart';
import 'package:global_gamers_challenge/power_cut_game/widgets/sky_widget.dart';
import 'package:global_gamers_challenge/power_cut_game/widgets/water_widget.dart';

class PowerCutGameController {
  PowerCutGameController._();

  static final PowerCutGameController instance = PowerCutGameController._();

  // late final StateMachineController? ctrl;
  // late final StateMachineController? ctrl2;
  // SMINumber? progressInput;
  // SMINumber? progressInput2;
  // double _counter1 = 0;
  // double _counter2 = 0;

  // Stream.periodic(const Duration(seconds: 1), (_) {
  //   progressInput?.value += 1;
  //   progressInput2?.value += 1;
  // });
  //
  // Timer.periodic(const Duration(milliseconds: 25), (timer) {
  //   setState(() {
  //     if (_counter1 >= 100) {
  //       _counter1 = 0;
  //       _counter2 = 0;
  //     } else {
  //       _counter1 += 0.8;
  //       _counter2 += 0.8;
  //     }
  //
  //     progressInput?.value = _counter1;
  //     progressInput2?.value = _counter2;
  //   });
  // });

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

  void manageAddingControlPanelItem(int count, List<Widget> list) {
    if (list.isEmpty) {
      list.add(const ControlPanelWidget());
    }

    if (count > 1) {
      for (var i = 0; i < count; i++) {
        list
          ..insert(0, const ControlPanelBackgroundWidget())
          ..add(const ControlPanelBackgroundWidget());
      }
    }
  }

  void manageRemovingBackgroundItems(int count, List<Widget> list) {
    final cVModel = CommonValuesModel.instance;

    if (list.length == cVModel.minCountBackgroundElements) {
      return;
    }

    list.removeRange(
        list.length - count >= cVModel.minCountBackgroundElements
            ? list.length - count
            : list.length - cVModel.minCountBackgroundElements,
        list.length);
  }

  void updateScroll({
    required ScrollController skyScrollCtrl,
    required ScrollController waterScrollCtrl,
    required ScrollController controlPanelScroll,
    bool isAnimate = false,
  }) {
    //if (kIsWeb) {
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
    // }
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
    //if (kIsWeb) {
    final cVModel = CommonValuesModel.instance;

    /// Sky
    if (skyList.isNotEmpty) {
      final skyWidth = skyList.length * cVModel.gradientWidth * cVModel.scale;

      /// Add sky elements
      if (skyWidth + 50 < cVModel.screenW) {
        final count = (cVModel.screenW / skyWidth).floor();

        manageAddingSkyItem(
          count % 2 == 0 ? count : count + 1,
          skyList,
        );
      } else

      /// Remove sky elements
      if (skyWidth - cVModel.screenW >= cVModel.gradientWidth * cVModel.scale * 2.5) {
        final count = (skyWidth / cVModel.screenW).floor();

        manageRemovingBackgroundItems(count - 1, skyList);
      }
    }

    /// Water
    if (waterList.isNotEmpty) {
      final waterWidth = waterList.length * cVModel.waterWidth * cVModel.scale;

      /// Add water elements
      if (waterWidth + 50 < cVModel.screenW) {
        final count = (cVModel.screenW / waterWidth).floor();

        manageAddingWaterItem(
          count % 2 == 0 ? count : count + 1,
          waterList,
        );
      } else

      /// Remove water elements
      if (waterWidth - cVModel.screenW > cVModel.waterWidth * cVModel.scale * 2.5) {
        final count = (waterWidth / cVModel.screenW).floor();

        // manageRemovingBackgroundItems(
        //   count % 2 == 0 ? count : count + 1,
        //   waterList,
        // );
        manageRemovingBackgroundItems(count - 1, waterList);
      }
    }

    /// Control panel
    if (ctrlPanelList.isNotEmpty) {
      final ctrlPanelWidth =
          ctrlPanelList.length * cVModel.ctrlPanelWidth * cVModel.scale;

      /// Add water elements
      if (ctrlPanelWidth + 50 < cVModel.screenW) {
        final count = (cVModel.screenW / ctrlPanelWidth).floor();

        manageAddingControlPanelItem(
          count % 2 == 0 ? count : count + 1,
          ctrlPanelList,
        );
      } else

      /// Remove water elements
      if (ctrlPanelWidth - cVModel.screenW > cVModel.ctrlPanelWidth * cVModel.scale * 2.5) {
        final count = (ctrlPanelWidth / cVModel.screenW).floor();

        // manageRemovingBackgroundItems(
        //   count % 2 == 0 ? count : count + 1,
        //   ctrlPanelList,
        // );
        manageRemovingBackgroundItems(count - 1, ctrlPanelList);
      }
    }

    updateScroll(
      skyScrollCtrl: skyScrollCtrl,
      waterScrollCtrl: waterScrollCtrl,
      controlPanelScroll: controlPanelScroll,
    );
    // }
  }

// Stack(
//   children: [
//     /// Background
//
//     Positioned.fill(
//       child: Container(
//         color: Colors.blue,
//         child: RiveAnimation.asset(
//           'assets/dayNight.riv',
//           fit: BoxFit.cover,
//           stateMachines: const ['State Machine 1'],
//           onInit: (artboard) {
//             ctrl = StateMachineController.fromArtboard(artboard, 'State Machine 1');
//             if (ctrl != null) {
//                 progressInput = ctrl!.inputs.first as SMINumber;
//                 artboard.addController(ctrl!);
//             }
//           },
//         ),
//       ),
//     ),
//     /// Water
//     Positioned.fill(
//       bottom: 0,
//       left: 0,
//       right: 0,
//       child: Container(
//         child: RiveAnimation.asset(
//           'assets/water.riv',
//           stateMachines: const ['State Machine 1'],
//           onInit: (artboard) {
//             ctrl2 = StateMachineController.fromArtboard(artboard, 'State Machine 1');
//             if (ctrl2 != null) {
//               setState(() {
//                 progressInput2 = ctrl2!.inputs.first as SMINumber;
//                 artboard.addController(ctrl2!);
//               });
//             }
//           },
//         ),
//       ),
//     ),
//   ],
// ),
// );
}
