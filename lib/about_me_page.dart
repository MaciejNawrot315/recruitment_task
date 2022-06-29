import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recruitment_task/animation_state_model.dart';
import 'package:recruitment_task/constants.dart';
import 'package:recruitment_task/cv_tile.dart';
import 'package:recruitment_task/language_row.dart';

import 'package:recruitment_task/water_animation_screen.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage>
    with TickerProviderStateMixin {
  List<Widget> cvTiles = [
    CvTile(
        title: "About Me",
        icon: const Icon(
          Icons.person_search_rounded,
          color: darkGreen,
        ),
        body: Align(
          alignment: Alignment.topLeft,
          child: RichText(
            text: const TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(
                      text: "•",
                      style: TextStyle(color: coralRed, fontSize: 25)),
                  TextSpan(text: "  I study Computer Science,\n"),
                  TextSpan(
                      text: "•",
                      style: TextStyle(color: coralRed, fontSize: 25)),
                  TextSpan(
                      text: "  I enjoy solving compliated logical problems,\n"),
                  TextSpan(
                      text: "•",
                      style: TextStyle(color: coralRed, fontSize: 25)),
                  TextSpan(
                      text:
                          "  I am enthusiastic about meeting new people and I feel comfortable working in a group,\n"),
                  TextSpan(
                      text: "•",
                      style: TextStyle(color: coralRed, fontSize: 25)),
                  TextSpan(
                      text:
                          "  I cherish in myself that I am creative and I am thinking outside the box,\n"),
                  TextSpan(
                      text: "•",
                      style: TextStyle(color: coralRed, fontSize: 25)),
                  TextSpan(
                      text:
                          "  I have recently learned about Flutter framework and I really like to think that I will develop professionally in this direction,\n"),
                  TextSpan(
                      text: "•",
                      style: TextStyle(color: coralRed, fontSize: 25)),
                  TextSpan(
                      text:
                          "  In my spare time I am interested in video games and producing music to listen to with my friends\n"),
                ]),
          ),
        )),
    CvTile(
        title: "Education",
        icon: const Icon(
          Icons.menu_book_rounded,
          color: darkGreen,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("(2019 - 2023)",
                style: TextStyle(color: coralRed, fontSize: 14)),
            SizedBox(height: 10),
            Text(
              "Silesian University of Technology, Faculty of Automatic Control, electronics and Computer Science, Gliwice, program: Informatics (in Polish) ",
            ),
            SizedBox(height: 15),
            Text("    semester: 6", style: TextStyle(fontSize: 16)),
            SizedBox(height: 15),
            Text("    specialization: Computer Graphics",
                style: TextStyle(fontSize: 16)),
            Divider(),
            SizedBox(height: 10),
            Text("(2016 - 2019)",
                style: TextStyle(color: coralRed, fontSize: 14)),
            SizedBox(height: 10),
            Text(
              "Liceum Ogólnokształcące im. Jana Pawła II w Siewierzu ",
            ),
          ],
        )),
    CvTile(
        title: "Experience",
        icon: const Icon(
          Icons.work,
          color: darkGreen,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("(January - May 2022)",
                style: TextStyle(color: coralRed, fontSize: 14)),
            const SizedBox(height: 8),
            const Text(
              "Developing a small Python program",
            ),
            const SizedBox(height: 8),
            const Text("    ARCO Spółka Jawna",
                style: TextStyle(
                    color: myGreen, fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(
                          text: "•",
                          style: TextStyle(color: coralRed, fontSize: 25)),
                      TextSpan(
                          text:
                              "  Creating a program whose task is to notify the user about the availability of products on the seller’s website, in real time. Program sends WhatsApp notifications and allows to view currently available products through a generated excel file. (Based on Selenium liblary),\n"),
                      TextSpan(
                          text: "•",
                          style: TextStyle(color: coralRed, fontSize: 25)),
                      TextSpan(
                          text:
                              "  Maintenance of the project, e.g. in the case of software updates or implementing small changes at the customer’s request:"),
                    ]),
              ),
            ),
            const Divider(),
            const SizedBox(height: 10),
            const Text("(June - August 2019)",
                style: TextStyle(color: coralRed, fontSize: 14)),
            const SizedBox(height: 8),
            const Text(
              "Working in an online shop",
            ),
            const SizedBox(height: 8),
            const Text("    ARCO Spółka Jawna",
                style: TextStyle(
                    color: myGreen, fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(
                          text: "•",
                          style: TextStyle(color: coralRed, fontSize: 25)),
                      TextSpan(
                          text:
                              "  Fulfilment of customer orders(packing products, sending parcels),\n"),
                      TextSpan(
                          text: "•",
                          style: TextStyle(color: coralRed, fontSize: 25)),
                      TextSpan(
                          text:
                              "  Operating of the order management program,\n"),
                      TextSpan(
                          text: "•",
                          style: TextStyle(color: coralRed, fontSize: 25)),
                      TextSpan(text: "  Initial acceptance of complaints,\n"),
                      TextSpan(
                          text: "•",
                          style: TextStyle(color: coralRed, fontSize: 25)),
                      TextSpan(text: "  Telephone customer service"),
                    ]),
              ),
            )
          ],
        )),
    CvTile(
        title: "Skills",
        icon: const Icon(
          Icons.lightbulb,
          color: darkGreen,
        ),
        body: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(
                          text: "•",
                          style: TextStyle(color: coralRed, fontSize: 25)),
                      TextSpan(
                          text:
                              "  Knowledge of algorithmics, mathematics and software engineering,\n"),
                      TextSpan(
                          text: "•",
                          style: TextStyle(color: coralRed, fontSize: 25)),
                      TextSpan(text: "  Programming Languages:"),
                    ]),
              ),
              Wrap(
                children: const [
                  LangRow(iconName: "assets/cpp.png", title: "C++", level: 3),
                  LangRow(
                      iconName: "assets/flutter.png",
                      title: "Flutter",
                      level: 2),
                  LangRow(iconName: "assets/css.png", title: "CSS", level: 1),
                  LangRow(iconName: "assets/html.png", title: "HTML", level: 1),
                  LangRow(
                      iconName: "assets/kotlin.png", title: "Kotlin", level: 1),
                  LangRow(
                      iconName: "assets/swift.png", title: "Swift", level: 1),
                ],
              ),
              RichText(
                text: const TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(
                          text: "•",
                          style: TextStyle(color: coralRed, fontSize: 25)),
                      TextSpan(text: "  English: C1,\n"),
                      TextSpan(
                          text: "•",
                          style: TextStyle(color: coralRed, fontSize: 25)),
                      TextSpan(text: "  Polish: native"),
                    ]),
              ),
            ],
          ),
        )),
    CvTile(
        title: "GITHUB",
        icon: const Icon(
          Icons.cottage_rounded,
          color: darkGreen,
        ),
        body: Row(
          children: [
            Image.asset(
              'assets/git.png',
              color: Colors.purple,
              width: 30,
              height: 30,
            ),
            const SelectableText(
              "   https://github.com/MaciejNawrot315",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        )),
    Container(
        alignment: Alignment.bottomRight,
        child: const Text(
          "Fueled by: Linkin Park, French Fries and Tosty z Serem",
          style: TextStyle(fontSize: 8, color: Colors.grey),
        ))
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
                          alignment: const Alignment(-0.95, 0.60),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: boneWhite,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
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
                          alignment: const Alignment(0.90, 0.60),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: boneWhite,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
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
                          alignment: const Alignment(0.9, 0.85),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: boneWhite,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
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
                          alignment: const Alignment(-0.95, 0.85),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: boneWhite,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
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
                            TableRow(children: [
                              cvTiles[2],
                              Column(
                                children: [cvTiles[3], cvTiles[4], cvTiles[5]],
                              )
                            ]),
                          ])
                        : Column(children: cvTiles)
                  ],
                ),
              ),
            ),
          ),
          animationFinished ? Container() : const WaterAnimationScreen(),
        ]),
      ),
    );
  }
}
