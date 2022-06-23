import 'package:flutter/material.dart';

class FavouriteImagesPage extends StatefulWidget {
  const FavouriteImagesPage({super.key});
  @override
  State<FavouriteImagesPage> createState() => _FavouriteImagesPageState();
}

class _FavouriteImagesPageState extends State<FavouriteImagesPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('I love my favourite pizza'),
        )
      ],
    );
  }
}
