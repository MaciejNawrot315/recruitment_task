import 'package:recruitment_task/about_me_page.dart';
import 'package:recruitment_task/favourite_images.dart';
import 'package:recruitment_task/images_page.dart';

import './constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recruitment Task',
      theme: ThemeData(primarySwatch: myPink),
      home: const MyHomePage(),
    );
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
    const ImagesPage(),
    const FavouriteImagesPage(),
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 640.0;
  }

//   bool _isMediumScreen(BuildContext context) {
//   return MediaQuery.of(context).size.width  960.0;
// }
  @override
  Widget build(BuildContext context) {
    if (_isLargeScreen(context)) {
      return Theme(
        data: ThemeData(primarySwatch: themeColors[_selectedIndex]),
        child: Scaffold(
            // appBar: AppBar(
            //   centerTitle: true,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.only(
            //     bottomRight: Radius.circular(36),
            //   )),
            //   title: const Text("About Me"),
            // ),
            body: Row(
          children: [
            NavigationRail(
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.account_box_rounded),
                  label: const Text("about me"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_outlined),
                  label: const Text("images"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.account_box_rounded),
                  label: const Text("favourite images"),
                ),
              ],
              selectedIndex: _selectedIndex,
              backgroundColor: themeColors[_selectedIndex],
              onDestinationSelected: _onDestinationSelected,
            ),
            _mainPages[_selectedIndex],
          ],
        )),
      );
    }
    return Theme(
      data: ThemeData(primarySwatch: themeColors[_selectedIndex]),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(36),
          )),
          title: const Text("About Me"),
        ),
        body: _mainPages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_rounded),
                label: "about me",
                backgroundColor: themeColors[0]),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: "images",
              backgroundColor: themeColors[1],
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outlined),
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
