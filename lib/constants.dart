import 'package:flutter/material.dart';

const Map<int, Color> myGreenMap = {
  50: Color.fromRGBO(12, 152, 105, .1),
  100: Color.fromRGBO(12, 152, 105, .2),
  200: Color.fromRGBO(12, 152, 105, .3),
  300: Color.fromRGBO(12, 152, 105, .4),
  400: Color.fromRGBO(12, 152, 105, .5),
  500: Color.fromRGBO(12, 152, 105, .6),
  600: Color.fromRGBO(12, 152, 105, .7),
  700: Color.fromRGBO(12, 152, 105, .8),
  800: Color.fromRGBO(12, 152, 105, .9),
  900: Color.fromRGBO(12, 152, 105, 1),
};
const MaterialColor myGreen = MaterialColor(0xFF0c9869, myGreenMap);
const Map<int, Color> myBlueMap = {
  50: Color.fromRGBO(82, 104, 243, .1),
  100: Color.fromRGBO(82, 104, 243, .2),
  200: Color.fromRGBO(82, 104, 243, .3),
  300: Color.fromRGBO(82, 104, 243, .4),
  400: Color.fromRGBO(82, 104, 243, .5),
  500: Color.fromRGBO(82, 104, 243, .6),
  600: Color.fromRGBO(82, 104, 243, .7),
  700: Color.fromRGBO(82, 104, 243, .8),
  800: Color.fromRGBO(82, 104, 243, .9),
  900: Color.fromRGBO(82, 104, 243, 1),
};
const MaterialColor myBlue = MaterialColor(0xFF5268F3, myBlueMap);
const Map<int, Color> myPinkMap = {
  50: Color.fromRGBO(221, 62, 84, .1),
  100: Color.fromRGBO(221, 62, 84, .2),
  200: Color.fromRGBO(221, 62, 84, .3),
  300: Color.fromRGBO(221, 62, 84, .4),
  400: Color.fromRGBO(221, 62, 84, .5),
  500: Color.fromRGBO(221, 62, 84, .6),
  600: Color.fromRGBO(221, 62, 84, .7),
  700: Color.fromRGBO(221, 62, 84, .8),
  800: Color.fromRGBO(221, 62, 84, .9),
  900: Color.fromRGBO(221, 62, 84, 1),
};
const MaterialColor myPink = MaterialColor(0xFFdd3e54, myPinkMap);

const Color darkGreen = Color.fromARGB(255, 30, 100, 77);
const Color coralRed = Color.fromARGB(255, 219, 128, 137);
const Color darkerCoralRed = Color.fromARGB(255, 160, 26, 39);
const Color boneWhite = Color.fromARGB(255, 241, 237, 238);

Color? appBackgroundColor = Colors.grey[850];
Color? tileColor = Colors.grey[800];

var themeColors = const [myGreen, myBlue, myPink];

const String baseUrl = 'api.unsplash.com';
const String photosEndpoint = '/photos';
int picturesToDisplay = 30;
double smallScreenBoundry = 768;
