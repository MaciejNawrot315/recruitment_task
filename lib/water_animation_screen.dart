import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recruitment_task/animation_state_model.dart';
import 'package:recruitment_task/growing_circle_clipper.dart';
import 'package:recruitment_task/tap_clipper.dart';

import 'constants.dart';

class WaterAnimationScreen extends StatefulWidget {
  WaterAnimationScreen({super.key});

  @override
  State<WaterAnimationScreen> createState() => _WaterAnimationScreenState();
}

class _WaterAnimationScreenState extends State<WaterAnimationScreen>
    with TickerProviderStateMixin {
  int tapClickedCouter = 0;
  bool tapTextHidden = false;
  bool backgroundChange = false;
  double tapOpacity = 0.0;
  final double tapWidth = 110;
  final double tapHeight = 100;
  late AnimationController runningWaterController;
  late Animation runningWaterAnimation;

  late AnimationController risingWaterController;
  late Animation risingWaterAnimation;

  late AnimationController colorWaterController;
  late Animation colorWaterAnimation;

  void _tapClicked() {
    if (tapClickedCouter == 1) {
      setState(() {
        runningWaterController.forward();
        tapTextHidden = true;
      });
      tapClickedCouter = 2;
    }
    if (tapClickedCouter == 0) {
      setState(() {
        tapOpacity = 1.0;
      });
      tapClickedCouter = 1;
    }
  }

  @override
  void initState() {
    super.initState();
    runningWaterController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    runningWaterAnimation =
        Tween(begin: 0.0, end: 1.0).animate(runningWaterController);
    runningWaterController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        risingWaterController.forward();
        runningWaterController.reverse();
      }
    });
    risingWaterController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    risingWaterAnimation =
        Tween(begin: 1.0, end: 0.0).animate(risingWaterController);
    risingWaterController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        colorWaterController.forward();
      }
    });
    colorWaterController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    colorWaterAnimation =
        Tween(begin: 0.0, end: 1.0).animate(colorWaterController);
    colorWaterController.addStatusListener((status) {
      var aniState = context.read<AnimationStateModel>();

      aniState.finish();
      // if (status == AnimationStatus.completed) {
      //   colorWaterController.forward();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (p0, constraints) => AnimatedBuilder(
            animation: colorWaterController,
            builder: ((context, child) => ClipPath(
                  clipBehavior: Clip.antiAlias,
                  clipper: GrowingCircleClipper(
                      offset: Offset(tapWidth * 0.76, tapHeight),
                      radius: colorWaterAnimation.value *
                          (constraints.maxHeight + constraints.maxWidth)),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(color: Colors.blue),
                      ),
                      AnimatedBuilder(
                        animation: risingWaterController,
                        builder: (context, child) => Container(
                          height: constraints.maxHeight *
                              risingWaterAnimation.value,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: tapWidth,
                        child: Column(
                          children: [
                            ClipPath(
                              clipper: TapClipper(),
                              child: AnimatedOpacity(
                                opacity: tapOpacity,
                                duration: const Duration(milliseconds: 500),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  height: tapHeight,
                                  color: appBackgroundColor,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: AnimatedBuilder(
                                animation: runningWaterController,
                                builder: (context, child) => Container(
                                  height: (constraints.maxHeight - tapHeight) *
                                      runningWaterAnimation.value,
                                  width: tapWidth * 0.26,
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: tapTextHidden
                            ? null
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Transform.rotate(
                                      angle: atan(constraints.maxHeight /
                                          constraints.maxWidth),
                                      child: AnimatedOpacity(
                                          opacity: tapOpacity,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          child: const Icon(Icons.arrow_back))),
                                  RichText(
                                    text: TextSpan(
                                        text: "Tap",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = (() => _tapClicked())),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ))));
  }

  @override
  void dispose() {
    risingWaterController.dispose();
    runningWaterController.dispose();
    colorWaterController.dispose();
    super.dispose();
  }
}
