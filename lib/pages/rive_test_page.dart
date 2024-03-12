import 'dart:async';

import 'package:flutter/material.dart';
import 'package:global_gamers_challenge/power_cut_game/flutter/widgets/button_widget.dart';
import 'package:rive/rive.dart';

class RiveTestPage extends StatefulWidget {
  const RiveTestPage({super.key});

  @override
  State<RiveTestPage> createState() => _RiveTestPageState();
}

class _RiveTestPageState extends State<RiveTestPage> {
  late final StateMachineController? ctrlRedToGreen;
  late final StateMachineController? ctrlGreenToRed;
  Timer? _timer;
  SMINumber? progressInputRTG;
  SMINumber? progressInputGTR;
  double _counter = 0;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 25), (timer) {
      setState(() {
        if (_counter >= 100) {
          _counter = 0;
        } else {
          _counter += 0.8;
        }

        progressInputRTG?.value = _counter;
        progressInputGTR?.value = _counter;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // log(_counter.toString());

    return Column(
      children: [
        /// Red to green
        SizedBox(
          width: 100,
          height: 100,
          child: RiveAnimation.asset(
            'assets/rive/dayNight.riv',
            fit: BoxFit.cover,
            stateMachines: const ['State Machine 1'],
            onInit: (artboard) {
              ctrlRedToGreen = StateMachineController.fromArtboard(
                  artboard, 'State Machine 1');
              if (ctrlRedToGreen != null) {
                progressInputRTG = ctrlRedToGreen!.inputs.first as SMINumber;
                artboard.addController(ctrlRedToGreen!);
              }
            },
          ),
        ),

        const SizedBox(height: 200),

        /// Green to red
        SizedBox(
          width: 100,
          height: 100,
          child: RiveAnimation.asset(
            'assets/rive/water.riv',
            fit: BoxFit.cover,
            stateMachines: const ['State Machine 1'],
            onInit: (artboard) {
              ctrlGreenToRed = StateMachineController.fromArtboard(
                  artboard, 'State Machine 1');
              if (ctrlGreenToRed != null) {
                progressInputGTR = ctrlGreenToRed!.inputs.first as SMINumber;
                artboard.addController(ctrlGreenToRed!);
              }
            },
          ),
        ),

        const SizedBox(height: 200),
        const ButtonWidget(),
      ],
    );
  }
}
