import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recruitment_task/constants.dart';

class CvTile extends StatelessWidget {
  const CvTile(
      {Key? key, required this.title, required this.icon, required this.body})
      : super(key: key);

  final String title;
  final Icon icon;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: boneWhite,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                      child: icon,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 0, 0),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: darkGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DefaultTextStyle(
                    style: GoogleFonts.karla(color: Colors.black, fontSize: 18),
                    child: body),
              )
            ],
          )),
    );
  }
}
