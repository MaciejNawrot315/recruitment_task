import 'package:flutter/material.dart';
import 'package:recruitment_task/constants.dart';
import 'package:recruitment_task/fav_images_model.dart';
import 'package:recruitment_task/picture.dart';
import './details_page.dart';
import 'package:provider/provider.dart';

class PictureTile extends StatefulWidget {
  final Picture picture;
  const PictureTile({Key? key, required this.picture}) : super(key: key);
  @override
  State<PictureTile> createState() => _PictureTileState();
}

class _PictureTileState extends State<PictureTile> {
  void _goToDetails(Picture picture) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => DetailsPage(picture: widget.picture)),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height > 750
        ? 750
        : MediaQuery.of(context).size.height;
    double imageWidth =
        (widget.picture.width! / widget.picture.height!) * height;
    bool isBig = MediaQuery.of(context).size.width > smallScreenBoundry;
    bool isFavourite = context.select<FavImagesModel, bool>(
        (favList) => favList.pictures.contains(widget.picture));

    IconButton favButton = IconButton(
      onPressed: isFavourite
          ? () {
              var favList = context.read<FavImagesModel>();
              favList.remove(widget.picture);
            }
          : () {
              var favList = context.read<FavImagesModel>();
              favList.add(widget.picture);
            },
      icon: isFavourite
          ? const Icon(
              Icons.favorite,
              color: Colors.pink,
            )
          : const Icon(Icons.favorite_border),
      color: Colors.white,
    );
    return LayoutBuilder(
      builder: (context, constraints) => Align(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(36.0),
            child: ((isBig) ||
                    (MediaQuery.of(context).orientation ==
                        Orientation.landscape)) //Display
                ? Container(
                    color: tileColor,
                    width: isBig ? 700 : constraints.maxWidth,
                    height: height,
                    child: Row(children: [
                      SizedBox(
                        width: isBig ? 700 * 0.8 : constraints.maxWidth * 0.8,
                        child: Center(
                          child: SizedBox(
                            width: imageWidth,
                            child: Hero(
                                tag: 'image${widget.picture.id}',
                                child: widget.picture.image!),
                          ),
                        ),
                      ),
                      const VerticalDivider(width: 1),
                      SizedBox(
                        width: isBig ? 700 * 0.19 : constraints.maxWidth * 0.19,
                        height: height,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 20, 25, 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "author: ${widget.picture.user!.name}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              TextButton.icon(
                                  onPressed: () => _goToDetails(widget.picture),
                                  icon: const Icon(Icons.arrow_forward),
                                  label: const Text("See details")),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 25, 5, 10),
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: favButton),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  )
                : Column(children: [
                    GestureDetector(
                      onTap: () => _goToDetails(widget.picture),
                      child: Hero(
                          tag: 'image${widget.picture.id}',
                          child: widget.picture.image!),
                    ),
                    Flex(
                        direction: Axis.horizontal,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Container(
                                color: tileColor,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 8, 25, 8),
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Text(
                                        "  author: ${widget.picture.user!.name}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      favButton
                                    ],
                                  ),
                                )),
                          ),
                        ])
                  ]),
          )),
    );
  }
}
