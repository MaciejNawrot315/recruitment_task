import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recruitment_task/animation_state_model.dart';
import 'package:recruitment_task/constants.dart';
import 'package:recruitment_task/cv_tile.dart';

import 'package:recruitment_task/water_animation_screen.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage>
    with TickerProviderStateMixin {
  List<CvTile> cvTiles = const [
    CvTile(
        title: "About Me",
        icon: Icon(
          Icons.person_search_rounded,
          color: darkGreen,
        ),
        body: Placeholder()),
    CvTile(
        title: "Education",
        icon: Icon(
          Icons.menu_book_rounded,
          color: darkGreen,
        ),
        body: Placeholder()),
    CvTile(
        title: "Experience",
        icon: Icon(
          Icons.work,
          color: darkGreen,
        ),
        body: Placeholder()),
    CvTile(
        title: "Skills",
        icon: Icon(
          Icons.lightbulb,
          color: darkGreen,
        ),
        body: Placeholder())
  ];
  @override
  Widget build(BuildContext context) {
    var aniState = context.read<AnimationStateModel>();
    bool animationFinished = aniState.state;
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      child: LayoutBuilder(
        builder: (context, constrains) => Stack(children: [
          SingleChildScrollView(
            child: Container(
              color: appBackgroundColor,
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: Stack(children: [
                        Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment(-1.0, -2.0),
                                  end: Alignment(1.0, 2.0),
                                  colors: [
                                    boneWhite,
                                    coralRed,
                                    darkerCoralRed
                                  ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                        ),
                        Center(
                          child: ClipOval(
                            child: Image.asset('assets/myPicture.bmp',
                                height: 170, width: 165),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.95, 0.60),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: boneWhite,
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                                child: Text(
                                  "Gliwice",
                                  style: GoogleFonts.karla(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                        Align(
                          alignment: Alignment(0.90, 0.60),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: boneWhite,
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                                child: Text(
                                  "age: 21",
                                  style: GoogleFonts.karla(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                        Align(
                          alignment: Alignment(0.9, 0.85),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: boneWhite,
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                                child: Text(
                                  "+48 501 147 555",
                                  style: GoogleFonts.karla(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                        Align(
                          alignment: Alignment(-0.95, 0.85),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: boneWhite,
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                                child: Text(
                                  "maciej.nawrot32@gmail.com",
                                  style: GoogleFonts.karla(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                      ]),
                    ),
                    MediaQuery.of(context).size.width > 786
                        ? Table(children: [
                            TableRow(children: [cvTiles[0], cvTiles[1]]),
                            TableRow(children: [cvTiles[2], cvTiles[3]]),
                          ])
                        : Column(children: cvTiles)
                  ],
                ),
              ),
            ),
          ),
          //animationFinished ? Container() : const WaterAnimationScreen(),
        ]),
      ),
    );
  }
}
