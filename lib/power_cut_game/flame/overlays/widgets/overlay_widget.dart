import 'package:flutter/material.dart';

class InterfaceWidget extends StatelessWidget {
  const InterfaceWidget(
    this.notifier,
    this.assetName, {
    this.imgWidth = 30,
    this.imgHeight = 30,
    super.key,
  });

  final ValueNotifier<int> notifier;
  final String assetName;
  final double imgWidth;
  final double imgHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (context, value, _) {
            return Stack(
              children: [
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                /// Icon
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Image.asset(
                    assetName,
                    width: imgWidth,
                    height: imgHeight,
                  ),
                ),

                /// Value
                SizedBox(
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 25),
                    child: Text(
                      value.toString(),
                      style: const TextStyle(color: Color(0xFFFF6A00)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
