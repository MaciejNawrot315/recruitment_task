import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recruitment_task/constants.dart';
import './picture.dart';
import 'package:recruitment_task/fav_images_model.dart';

class DetailsPage extends StatefulWidget {
  final Picture picture;

  const DetailsPage({Key? key, required this.picture}) : super(key: key);
  @override
  State<DetailsPage> createState() => _DetailsState();
}

class _DetailsState extends State<DetailsPage> {
  List<Widget> details = [];

  List<Widget> _createDetails() {
    var indentaion = const EdgeInsets.fromLTRB(
      30.0,
      2.0,
      8.0,
      2.0,
    );
    List<Widget> list = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SelectableText(
          "author: ${widget.picture.user!.name}",
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SelectableText(
          "username: ${widget.picture.user!.username}",
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SelectableText(
          "image id: ${widget.picture.id}",
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SelectableText(
          "created at: ${widget.picture.createdAt}",
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SelectableText(
          "updated at: ${widget.picture.updatedAt}",
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SelectableText(
          "original width: ${widget.picture.width}",
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SelectableText(
          "original height: ${widget.picture.height}",
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              "leading color:  ${widget.picture.color}  ",
            ),
            SizedBox(
              width: 18,
              height: 18,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(2),
                    color: Color(int.parse(
                        "0xff${widget.picture.color!.substring(1)}"))),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SelectableText(
          "number of downloads: ${widget.picture.downloads}",
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SelectableText(
          "likes: ${widget.picture.likes}",
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SelectableText(
          "description: ${widget.picture.description ?? ""}",
        ),
      ),
      const Padding(padding: EdgeInsets.all(8.0), child: Text("exif:")),
      Padding(
          padding: indentaion,
          child: SelectableText("make: ${widget.picture.exif!.make}")),
      Padding(
          padding: indentaion,
          child: SelectableText("model: ${widget.picture.exif!.model}")),
      Padding(
          padding: indentaion,
          child: SelectableText(
              "exposure time: ${widget.picture.exif!.exposureTime}")),
      Padding(
          padding: indentaion,
          child: SelectableText("make: ${widget.picture.exif!.make}")),
      Padding(
          padding: indentaion,
          child: SelectableText("aperture: ${widget.picture.exif!.aperture}")),
      Padding(
          padding: indentaion,
          child: SelectableText(
              "focalLength: ${widget.picture.exif!.focalLength}")),
      Padding(
          padding: indentaion, child: Text("iso: ${widget.picture.exif!.iso}")),
      const Padding(
          padding: EdgeInsets.all(8.0),
          child: SelectableText(
            "location:",
          )),
      Padding(
          padding: indentaion,
          child: SelectableText("name: ${widget.picture.location!.name}")),
      Padding(
          padding: indentaion,
          child: SelectableText("city: ${widget.picture.location!.city}")),
      Padding(
          padding: indentaion,
          child:
              SelectableText("country: ${widget.picture.location!.country}")),
      Padding(padding: indentaion, child: const Text("position:")),
      Padding(
          padding: const EdgeInsets.fromLTRB(
            60.0,
            2.0,
            8.0,
            2.0,
          ),
          child: SelectableText(
              "latitude: ${widget.picture.location!.position!.latitude}")),
      Padding(
          padding: const EdgeInsets.fromLTRB(
            60.0,
            2.0,
            8.0,
            2.0,
          ),
          child: SelectableText(
              "longitude: ${widget.picture.location!.position!.longitude}")),
      Padding(
        padding: const EdgeInsets.fromLTRB(
          8.0,
          14.0,
          8.0,
          2.0,
        ),
        child: SelectableText(
          "link to original: ${widget.picture.urls!.raw}",
        ),
      ),
    ];
    return list;
  }

  @override
  void initState() {
    super.initState();
    details = _createDetails();
  }

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: appBackgroundColor,
        body: ((MediaQuery.of(context).size.width > smallScreenBoundry) ||
                (MediaQuery.of(context).orientation == Orientation.landscape))
            ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: Container(
                      color: tileColor,
                      width: MediaQuery.of(context).size.width > 1080
                          ? 1080
                          : MediaQuery.of(context).size.width,
                      height: 750,
                      child: Row(children: [
                        SizedBox(
                          //picture Rect
                          width: MediaQuery.of(context).size.width > 1080
                              ? 640
                              : MediaQuery.of(context).size.width * 0.60,
                          child: Center(
                            child: Hero(
                                tag: 'image${widget.picture.id}',
                                child: widget.picture.image!),
                          ),
                        ),
                        const VerticalDivider(width: 1),
                        SizedBox(
                          width: MediaQuery.of(context).size.width > 1080
                              ? 439
                              : MediaQuery.of(context).size.width * 0.38,
                          height: 750,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 20, 25, 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: SingleChildScrollView(
                                  child: DefaultTextStyle(
                                    style: const TextStyle(color: Colors.white),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: details,
                                    ),
                                  ),
                                )),
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
                    ))
              ])
            : SingleChildScrollView(
                child: DefaultTextStyle(
                  style: const TextStyle(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                          tag: 'image${widget.picture.id}',
                          child: widget.picture.image!),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 15, 0),
                        child: Align(
                            alignment: Alignment.topRight, child: favButton),
                      ),
                      ...details
                    ],
                  ),
                ),
              ));
  }
}
