import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recruitment_task/fav_images_model.dart';

class FavouriteImagesPage extends StatefulWidget {
  const FavouriteImagesPage({super.key});
  @override
  State<FavouriteImagesPage> createState() => _FavouriteImagesPageState();
}

class _FavouriteImagesPageState extends State<FavouriteImagesPage> {
  @override
  Widget build(BuildContext context) {
    var favList = context.watch<FavImagesModel>();
    return ListView.builder(
      itemCount: favList.pictures.length,
      itemBuilder: (context, index) =>
          Text("author:${favList.pictures[index].user!.name}"),
    );
  }
}
