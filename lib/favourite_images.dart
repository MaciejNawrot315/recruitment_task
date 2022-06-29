import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recruitment_task/constants.dart';
import 'package:recruitment_task/fav_images_model.dart';
import 'package:recruitment_task/picture_tile.dart';

class FavouriteImagesPage extends StatefulWidget {
  const FavouriteImagesPage({super.key});
  @override
  State<FavouriteImagesPage> createState() => _FavouriteImagesPageState();
}

class _FavouriteImagesPageState extends State<FavouriteImagesPage> {
  @override
  Widget build(BuildContext context) {
    var favList = context.watch<FavImagesModel>();
    return Container(
        color: Colors.grey[400],
        child: favList.pictures.isEmpty
            ? const Center(child: Text("No favourite images to display"))
            : ListView.separated(
                itemBuilder: ((context, index) {
                  return PictureTile(picture: favList.pictures[index]);
                }),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                itemCount: favList.pictures.length));
  }
}
