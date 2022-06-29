import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recruitment_task/about_me_page.dart';
import 'package:recruitment_task/animation_state_model.dart';
import 'package:recruitment_task/fav_images_model.dart';
import 'package:recruitment_task/favourite_images.dart';
import 'package:recruitment_task/pictures_page.dart';

import './constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AnimationStateModel(),
        child: ChangeNotifierProvider(
            create: (context) => FavImagesModel(),
            child: MaterialApp(
              title: 'Recruitment Task',
              theme: ThemeData(
                primarySwatch: myBlue,
                backgroundColor: Colors.grey[850],
                textTheme:
                    GoogleFonts.kanitTextTheme(Theme.of(context).textTheme),
              ),
              home: const MyHomePage(),
            )));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _mainPages = [
    const AboutMePage(),
    PicturesPage(),
    const FavouriteImagesPage(),
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 768.0;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primarySwatch: themeColors[_selectedIndex]),
      child: _isLargeScreen(context)
          ? Scaffold(
              body: Row(
                children: [
                  NavigationRail(
                    destinations: const <NavigationRailDestination>[
                      NavigationRailDestination(
                        icon: Icon(Icons.account_box_rounded),
                        label: Text("about me"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.image),
                        label: Text("images"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite_outlined),
                        label: Text("favourite images"),
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    backgroundColor: themeColors[_selectedIndex],
                    selectedIconTheme: const IconThemeData(color: Colors.white),
                    onDestinationSelected: _onDestinationSelected,
                  ),
                  Expanded(
                    child: _mainPages[_selectedIndex],
                  ),
                ],
              ),
            )
          : Scaffold(
              body: _mainPages[_selectedIndex],
              bottomNavigationBar: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.account_box_rounded),
                      label: "about me",
                      backgroundColor: themeColors[0]),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.image),
                    label: "images",
                    backgroundColor: themeColors[1],
                  ),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.favorite_outlined),
                      label: "favourite images",
                      backgroundColor: themeColors[2]),
                ],
                currentIndex: _selectedIndex,
                type: BottomNavigationBarType.shifting,
                onTap: _onDestinationSelected,
              ),
            ),
    );
  }
}
