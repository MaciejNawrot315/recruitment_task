import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recruitment_task/animation_state_model.dart';
import 'package:recruitment_task/constants.dart';

import 'package:recruitment_task/water_animation_screen.dart';

class AboutMePage extends StatefulWidget {
  AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var aniState = context.read<AnimationStateModel>();

    bool animationFinished = aniState.state;
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      child: LayoutBuilder(
        builder: (context, constrains) => Stack(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.blue,
                child: Container(
                  color: appBackgroundColor,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("SOME EXAMPLE TEXT1"),
                          Text("SOME EXAMPLE TEXT2"),
                          Text("SOME EXAMPLE TEXT3"),
                          Text("SOME EXAMPLE TEXT4"),
                        ]),
                  ),
                ),
              ),
              animationFinished ? Container() : WaterAnimationScreen(),
            ]),
      ),
    );
  }
}
